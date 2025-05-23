
import { DataItem } from "@/models/models";
import { getTableComponent } from "@/models/pages";

interface TableContentProps {
  items: DataItem[];
  paginatedItems: DataItem[];
  pathname: string;
  selectedItems: string[];
  onToggleItem: (id: string) => void;
  onSelectAll: () => void;
  onSelectNone: () => void;
  onView?: (item: DataItem) => void;
  onContextMenu: (e: React.MouseEvent, id: string) => void;
  onSort: (key: keyof DataItem) => void;
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
  colorFilter?: string;
}

export const TableContent = ({
  items,
  paginatedItems,
  pathname,
  selectedItems,
  onToggleItem,
  onSelectAll,
  onSelectNone,
  onView,
  onContextMenu,
  onSort,
  currentPage,
  totalPages,
  onPageChange,
  colorFilter
}: TableContentProps) => {
  const filteredItems = colorFilter 
    ? paginatedItems.filter(item => item.identification_color === colorFilter)
    : paginatedItems;

  if (filteredItems.length === 0) {
    return (
        <div className="py-8 text-center">
          <p className="text-muted-foreground">
            Nenhum registro encontrado
          </p>
        </div>
    )
  }

  const TableComponent = getTableComponent(pathname);

  const handleRowClick = (e: React.MouseEvent, item) => {
    e.stopPropagation();
    if (onView) {
      onView(item);
    }
  };

  const onToggleAll = () => {
    console.log('selectedItems.length', selectedItems.length);
    console.log('items.length', items.length);
    return selectedItems.length === items.length ? onSelectNone() : onSelectAll()
  };

  return (
      <TableComponent
        items={items}
        allSelected={selectedItems.length === items.length && items.length > 0}
        onToggleAll={onToggleAll}
        filteredItems={filteredItems}
        handleRowClick={handleRowClick}
        selectedItems={selectedItems}
        onToggleItem={onToggleItem}
        onContextMenu={onContextMenu}
        onSort={onSort}
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={onPageChange}
      />
    );

};
