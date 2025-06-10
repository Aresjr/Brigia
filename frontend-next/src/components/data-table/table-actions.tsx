'use client';

import { Button } from "@/components/ui/button";
import { Plus, Download, Trash2 } from "lucide-react";
import { exportToCSV } from "@/lib/utils/export";
import { Patient } from "@/lib/types";

interface TableActionsProps {
    selectedItems: string[];
    items: Patient[];
    onNewRecord: () => void;
    onDeleteSelected: () => void;
}

export function TableActions({
    selectedItems,
    items,
    onNewRecord,
    onDeleteSelected,
}: TableActionsProps) {
    const hasSelection = selectedItems.length > 0;

    const handleExport = () => {
        const selectedData = items.filter(item =>
            selectedItems.includes(item.id.toString())
        );

        exportToCSV(selectedData, {
            customFormatters: {
                birth_date: (date: string) => date ? new Date(date).toLocaleDateString() : '-',
                last_appointment: (date: string) => date ? new Date(date).toLocaleString() : '-',
                next_appointment: (date: string) => date ? new Date(date).toLocaleString() : '-',

