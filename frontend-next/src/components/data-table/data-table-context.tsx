'use client';

import { createContext, useContext, useState } from 'react';

interface DataTableState {
    visibleColumns: string[];
    setVisibleColumns: (columns: string[]) => void;
    toggleColumn: (column: string) => void;
}

const DataTableContext = createContext<DataTableState | undefined>(undefined);

export function DataTableProvider({
    children,
    defaultColumns
}: {
    children: React.ReactNode;
    defaultColumns: string[];
}) {
    const [visibleColumns, setVisibleColumns] = useState(defaultColumns);

    const toggleColumn = (column: string) => {
        setVisibleColumns(prev => {
            if (prev.includes(column)) {
                return prev.filter(col => col !== column);
            }
            return [...prev, column];
        });
    };

    return (
        <DataTableContext.Provider value={{
            visibleColumns,
            setVisibleColumns,
            toggleColumn,
        }}>
            {children}
        </DataTableContext.Provider>
    );
}

export function useDataTable() {
    const context = useContext(DataTableContext);
    if (!context) {
        throw new Error('useDataTable must be used within a DataTableProvider');
    }
    return context;
}
