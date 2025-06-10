'use client';

import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { AlertCircle } from "lucide-react";

interface ErrorStateProps {
    error: Error;
}

export function ErrorState({ error }: ErrorStateProps) {
    return (
        <Alert variant="destructive">
            <AlertCircle className="h-4 w-4" />
            <AlertTitle>Erro</AlertTitle>
            <AlertDescription>
                {error.message || 'Ocorreu um erro ao carregar os dados'}
            </AlertDescription>
        </Alert>
    );
}
