
import { LucideIcon } from "lucide-react";

export interface Profile {
  id: string | number;
  name: string | null;
  avatar_url: string | null;
  role: string;
  theme?: string | null;
  establishment?: string | null;
}

export interface SidebarProps {
  onExpand: (expanded: boolean) => void;
}

export interface MenuItem {
  label: string;
  icon: LucideIcon;
  path?: string;
  items?: MenuItem[];
}
