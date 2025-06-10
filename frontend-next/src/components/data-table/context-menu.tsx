'use client';

import {
    ContextMenu,
    ContextMenuContent,
    ContextMenuItem,
    ContextMenuTrigger,
} from "@/components/ui/context-menu";
import { Pencil, Trash } from "lucide-react";

interface DataContextMenuProps {
    onEdit: () => void;
    onDelete: () => void;
}

export function DataContextMenu({ x, y, onClose, onEdit, onDelete }: DataContextMenuProps & { x: number; y: number; onClose: () => void }) {
    return (
        <div
            className="fixed inset-0"
            style={{ pointerEvents: "none" }}
            onClick={onClose}
        >
            <div
                className="absolute bg-white rounded-md shadow-lg"
                style={{
                    left: x,
                    top: y,
                    pointerEvents: "auto"
                }}
            >
                <div className="py-1">
                    <button
                        onClick={(e) => {
                            e.stopPropagation();
                            onEdit();
                            onClose();
                        }}
                        className="w-full px-4 py-2 text-sm text-left text-gray-700 hover:bg-gray-100 hover:text-gray-900 flex items-center gap-2"
                    >
                        <Pencil className="h-4 w-4" />
                        Editar
                    </button>
                    <button
                        onClick={(e) => {
                            e.stopPropagation();
                            onDelete();
                            onClose();
                        }}
                        className="w-full px-4 py-2 text-sm text-left text-red-600 hover:bg-gray-100 hover:text-red-700 flex items-center gap-2"
                    >
                        <Trash className="h-4 w-4" />
                        Excluir
                    </button>
                </div>
            </div>
        </div>
    );
}
