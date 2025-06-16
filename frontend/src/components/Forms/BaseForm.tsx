import { BaseEntity } from "@/models/models";
import { Button } from "@/components/ui/button";

interface BaseFormProps<T extends BaseEntity> {
    onSubmit: (data: Omit<T, 'id' | 'created_at'>) => void;
    initialData?: T | null;
    isSubmitting?: boolean;
    children: React.ReactNode;
}

export function BaseForm<T extends BaseEntity>({
    onSubmit,
    initialData,
    isSubmitting = false,
    children
}: BaseFormProps<T>) {
    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        if (!isSubmitting) {
            onSubmit(initialData as Omit<T, 'id' | 'created_at'>);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="space-y-6">
            {children}
            <Button
                type="submit"
                className="w-full"
                disabled={isSubmitting}
            >
                {isSubmitting ? 'Salvando...' : initialData ? 'Atualizar' : 'Salvar'}
            </Button>
        </form>
    );
}
