
import { useLocation, useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { MenuItem } from "./types";

interface SidebarItemProps {
  item: MenuItem;
  expanded: boolean;
  expandedGroups: string[];
  toggleGroup: (label: string) => void;
  onExpandSidebar?: () => void;
  onItemClick?: () => void;
}

export const SidebarItem = ({ 
  item, 
  expanded, 
  expandedGroups, 
  toggleGroup,
  onExpandSidebar,
  onItemClick
}: SidebarItemProps) => {
  const location = useLocation();
  const navigate = useNavigate();
  
  if (item.items) {
    return (
      <SidebarItemWithChildren 
        item={item} 
        expanded={expanded} 
        expandedGroups={expandedGroups} 
        toggleGroup={toggleGroup}
        onExpandSidebar={onExpandSidebar}
        onItemClick={onItemClick}
      />
    );
  }
  
  const handleClick = () => {
    if (onItemClick) {
      onItemClick();
    }
    
    if (!expanded && onExpandSidebar) {
      onExpandSidebar();
      // We don't navigate immediately when sidebar is collapsed to give time for expansion
      setTimeout(() => navigate(item.path!), 100);
    } else {
      navigate(item.path!);
    }
  };
  
  return (
    <Button
      variant={location.pathname === item.path ? "secondary" : "ghost"}
      className={cn(
        "w-full justify-start my-1 hover:bg-gray-200",
        expanded ? "" : "justify-center",
        location.pathname === item.path && "bg-[#524ED2] text-white hover:bg-[#524ED2]/90"
      )}
      onClick={handleClick}
    >
      <item.icon className={cn("h-4 w-4", expanded ? "mr-3" : "")} />
      {expanded && item.label}
    </Button>
  );
};

interface SidebarItemWithChildrenProps extends SidebarItemProps {}

const SidebarItemWithChildren = ({ 
  item, 
  expanded, 
  expandedGroups, 
  toggleGroup,
  onExpandSidebar,
  onItemClick
}: SidebarItemWithChildrenProps) => {
  const location = useLocation();
  const navigate = useNavigate();
  
  const handleGroupClick = () => {
    if (onItemClick) {
      onItemClick();
    }
    
    if (!expanded && onExpandSidebar) {
      onExpandSidebar();
    } else {
      toggleGroup(item.label);
    }
  };
  
  const handleSubItemClick = (path: string) => {
    if (onItemClick) {
      onItemClick();
    }
    
    if (!expanded && onExpandSidebar) {
      onExpandSidebar();
      // We don't navigate immediately when sidebar is collapsed to give time for expansion
      setTimeout(() => navigate(path), 100);
    } else {
      navigate(path);
    }
  };
  
  return (
    <div>
      <Button
        variant="ghost"
        className="w-full justify-start hover:bg-gray-200"
        onClick={handleGroupClick}
      >
        <item.icon className="h-4 w-4 mr-3" />
        {expanded && (
          <>
            {item.label}
            {expandedGroups.includes(item.label) ? (
              <ChevronDown className="h-4 w-4 ml-auto" />
            ) : (
              <ChevronRight className="h-4 w-4 ml-auto" />
            )}
          </>
        )}
      </Button>
      {expanded && expandedGroups.includes(item.label) && (
        <ul className="pl-4">
          {item.items!.map((subItem, subIndex) => (
            <li key={subIndex}>
              <Button
                variant={location.pathname === subItem.path ? "secondary" : "ghost"}
                className={cn(
                  "w-full justify-start my-1 hover:bg-gray-200",
                  location.pathname === subItem.path && "bg-[#524ED2] text-white hover:bg-[#524ED2]/90"
                )}
                onClick={() => handleSubItemClick(subItem.path!)}
              >
                <subItem.icon className="h-4 w-4 mr-3" />
                {subItem.label}
              </Button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

// Add missing imports
import { ChevronDown, ChevronRight } from "lucide-react";
