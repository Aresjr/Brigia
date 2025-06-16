import { useState, useEffect } from "react";
import { BaseEntity } from "@/models/models";

export function useBaseTableState<T extends BaseEntity>(
    isLoading: boolean,
    items: T[],
    applyFilters: (items: T[], searchTerm: string, sortConfig: { key: keyof T; direction: 'asc' | 'desc' }) => T[]
) {
    const [contextMenu, setContextMenu] = useState<{ x: number; y: number; id: string | null }>({ x: 0, y: 0, id: null });
    const [searchTerm, setSearchTerm] = useState("");
    const [filterField, setFilterField] = useState<string>("name");
    const [filteredItems, setFilteredItems] = useState<T[]>([]);
    const [sortConfig, setSortConfig] = useState<{ key: keyof T; direction: 'asc' | 'desc' }>({
        key: "created_at" as keyof T,
        direction: 'desc'
    });
    const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
    const [itemsToDelete, setItemsToDelete] = useState<string[]>([]);
    const [currentPage, setCurrentPage] = useState(1);

    const ITEMS_PER_PAGE = 15;
    const totalPages = Math.ceil(filteredItems.length / ITEMS_PER_PAGE);

    const paginatedItems = filteredItems.slice(
        (currentPage - 1) * ITEMS_PER_PAGE,
        currentPage * ITEMS_PER_PAGE
    );

    const handleSort = (key: keyof T) => {
        let direction: 'asc' | 'desc' = 'asc';
        if (sortConfig && sortConfig.key === key && sortConfig.direction === 'asc') {
            direction = 'desc';
        }
        setSortConfig({ key, direction });
    };

    const handleContextMenu = (e: React.MouseEvent, id: string) => {
        e.preventDefault();
        setContextMenu({ x: e.clientX, y: e.clientY, id });
    };

    const closeContextMenu = () => {
        setContextMenu({ x: 0, y: 0, id: null });
    };

    const handleConfirmDelete = (ids: string[]) => {
        setItemsToDelete(ids);
        setShowDeleteConfirmation(true);
    };

    useEffect(() => {
        const handleClick = () => closeContextMenu();
        document.addEventListener('click', handleClick);
        return () => document.removeEventListener('click', handleClick);
    }, []);

    useEffect(() => {
        if (!isLoading) {
            const filtered = applyFilters(items, searchTerm, sortConfig);
            setFilteredItems(filtered);
        }
    }, [items, searchTerm, sortConfig, isLoading, applyFilters]);

    return {
        contextMenu,
        searchTerm,
        setSearchTerm,
        filterField,
        setFilterField,
        filteredItems,
        paginatedItems,
        sortConfig,
        showDeleteConfirmation,
        setShowDeleteConfirmation,
        itemsToDelete,
        setItemsToDelete,
        currentPage,
        setCurrentPage,
        totalPages,
        handleSort,
        handleContextMenu,
        closeContextMenu,
        handleConfirmDelete
    };
}
