'use client';

import { ArrowDown, ArrowUp, ArrowUpDown } from "lucide-react";
import { cn } from "@/lib/utils";

interface SortIndicatorProps {
    direction?: 'asc' | 'desc' | null;
    className?: string;
}

export function SortIndicator({ direction, className }: SortIndicatorProps) {
    if (!direction) {
        return <ArrowUpDown className={cn("h-4 w-4 text-muted-foreground", className)} />;
    }

    return direction === 'asc' ? (
        <ArrowUp className={cn("h-4 w-4", className)} />
    ) : (
        <ArrowDown className={cn("h-4 w-4", className)} />
    );
}
