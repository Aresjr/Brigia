'use client';

import { useState, useCallback, useEffect } from 'react';

interface TableState<T> {
    searchTerm: string;
    filterField: string;
    colorFilter?: string;
    sortConfig: { key: string; direction: 'asc' | 'desc' };
    currentPage: number;
    itemsPerPage: number;
}

export function useTableState<T>(
    items: T[],
    initialState: Partial<TableState<T>> = {}
) {
    const [searchTerm, setSearchTerm] = useState(initialState.searchTerm || '');
    const [filterField, setFilterField] = useState(initialState.filterField || 'name');
    const [colorFilter, setColorFilter] = useState(initialState.colorFilter);
    const [sortConfig, setSortConfig] = useState(initialState.sortConfig || { key: 'name', direction: 'asc' });
    const [currentPage, setCurrentPage] = useState(initialState.currentPage || 1);
    const [itemsPerPage] = useState(initialState.itemsPerPage || 10);

    const filterItems = useCallback((items: T[]) => {
        let filtered = [...items];

        // Apply search filter
        if (searchTerm) {
            filtered = filtered.filter((item: any) => {
                const value = item[filterField];
                return value?.toString().toLowerCase().includes(searchTerm.toLowerCase());
            });
        }

        // Apply color filter
        if (colorFilter && 'identification_color' in Object.assign({}, filtered[0])) {
            filtered = filtered.filter((item: any) => item.identification_color === colorFilter);
        }

        // Apply sorting
        filtered.sort((a: any, b: any) => {
            const aVal = a[sortConfig.key];
            const bVal = b[sortConfig.key];

            // Handle null/undefined values
            if (!aVal && !bVal) return 0;
            if (!aVal) return 1;
            if (!bVal) return -1;

            // Handle date strings
            if (typeof aVal === 'string' && aVal.includes('-') && !isNaN(Date.parse(aVal))) {
                const dateA = new Date(aVal);
                const dateB = new Date(bVal);
                return sortConfig.direction === 'asc'
                    ? dateA.getTime() - dateB.getTime()
                    : dateB.getTime() - dateA.getTime();
            }

            // Handle regular strings and numbers
            if (aVal < bVal) return sortConfig.direction === 'asc' ? -1 : 1;
            if (aVal > bVal) return sortConfig.direction === 'asc' ? 1 : -1;
            return 0;
        });

        return filtered;
    }, [searchTerm, filterField, colorFilter, sortConfig]);

    const paginateItems = useCallback((items: T[]) => {
        const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        return items.slice(start, end);
    }, [currentPage, itemsPerPage]);

    const filteredItems = filterItems(items);
    const paginatedItems = paginateItems(filteredItems);
    const totalPages = Math.ceil(filteredItems.length / itemsPerPage);

    // Reset to first page when filters change
    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm, filterField, colorFilter]);

    const handleSort = (key: string) => {
        setSortConfig(prev => ({
            key,
            direction: prev.key === key && prev.direction === 'asc' ? 'desc' : 'asc'
        }));
    };

    return {
        searchTerm,
        setSearchTerm,
        filterField,
        setFilterField,
        colorFilter,
        setColorFilter,
        sortConfig,
        handleSort,
        currentPage,
        setCurrentPage,
        totalPages,
        filteredItems,
        paginatedItems
    };
}
