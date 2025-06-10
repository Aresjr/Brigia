import { Suspense } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { routes } from './routes';
import { Loader2 } from "lucide-react";
import { MainLayout } from '@/layouts/MainLayout';

export const Router = () => {
    return (
        <Routes>
            <Route element={<MainLayout />}>
                {routes.map(({ path, component: Component }) => (
                    <Route
                        key={path}
                        path={path}
                        element={
                            <Suspense fallback={
                                <div className="h-[50vh] flex items-center justify-center">
                                    <Loader2 className="h-8 w-8 animate-spin text-muted-foreground"/>
                                </div>
                            }>
                                <Component />
                            </Suspense>
                        }
                    />
                ))}
                <Route path="*" element={<Navigate to="/" replace />} />
            </Route>
        </Routes>
    );
};
