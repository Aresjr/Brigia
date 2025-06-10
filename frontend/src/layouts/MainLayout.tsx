import { Outlet } from "react-router-dom";
import { Sidebar } from "@/components/Sidebar";

export const MainLayout = () => {
    return (
        <div className="min-h-screen">
            <div className="flex h-screen">
                <Sidebar />
                <main className="flex-1 overflow-y-auto p-8">
                    <Outlet />
                </main>
            </div>
        </div>
    );
};
