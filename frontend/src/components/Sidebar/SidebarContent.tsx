
import { Separator } from "@/components/ui/separator";
import { SidebarItem } from "./SidebarItem";
import { MenuItem } from "./types";

interface SidebarContentProps {
  items: MenuItem[];
  expanded: boolean;
  expandedGroups: string[];
  toggleGroup: (label: string) => void;
  searchTerm: string;
  onExpandSidebar?: () => void;
}

export const SidebarContent = ({ 
  items, 
  expanded, 
  expandedGroups, 
  toggleGroup,
  searchTerm,
  onExpandSidebar
}: SidebarContentProps) => {
  const filterMenuItems = (items: MenuItem[]) => {
    return items.map(item => {
      if (item.items) {
        return {
          ...item,
          items: item.items.filter(subItem => 
            subItem.label.toLowerCase().includes(searchTerm.toLowerCase())
          )
        };
      }
      return item;
    }).filter(item => 
      item.label.toLowerCase().includes(searchTerm.toLowerCase()) ||
      (item.items && item.items.length > 0)
    );
  };

  const filteredItems = filterMenuItems(items);

  return (
    <>
      <Separator />
      <div className="flex-1 overflow-y-auto">
        <ul className="px-3 py-2">
          {filteredItems.map((item, index) => (
            <li key={index}>
              <SidebarItem 
                item={item} 
                expanded={expanded} 
                expandedGroups={expandedGroups}
                toggleGroup={toggleGroup}
                onExpandSidebar={onExpandSidebar}
              />
            </li>
          ))}
        </ul>
      </div>
    </>
  );
};
