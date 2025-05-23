
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { cn } from "@/lib/utils";
import { useIsMobile } from "@/hooks/use-mobile";
import { SidebarHeader } from "./Sidebar/SidebarHeader";
import { SidebarContent } from "./Sidebar/SidebarContent";
import { SidebarFooter } from "./Sidebar/SidebarFooter";
import { Profile } from "./Sidebar/types";
import { useMenuItems } from "./Sidebar/menuItems";
import { getProfile } from "@/services/dbService";
import { TableName } from "@/models/tables";

interface SidebarProps {
  onExpand: (expanded: boolean) => void;
}

export default function Sidebar({
  onExpand
}: SidebarProps) {
  const [expanded, setExpanded] = useState(true);
  const [expandedGroups, setExpandedGroups] = useState<string[]>([]);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [searchTerm, setSearchTerm] = useState("");
  const isMobile = useIsMobile();
  const menuItems = useMenuItems();

  useEffect(() => {
    if (isMobile) {
      setExpanded(false);
    } else {
      setExpanded(true);
    }
  }, [isMobile]);

  useEffect(() => {
    onExpand(expanded);
  }, [expanded, onExpand]);

  useEffect(() => {
    if (searchTerm) {
      setExpandedGroups(menuItems.filter(item => item.items).map(item => item.label));
    }
  }, [searchTerm, menuItems]);

  useEffect(() => {
    const fetchProfile = async () => {
      const {
        data: {
          session
        }
      } = await supabase.auth.getSession();
      if (session?.user) {
        const profileData = await getProfile(session.user.id);
        setProfile(profileData);
      }
    };
    fetchProfile();
  }, []);

  const toggleGroup = (label: string) => {
    setExpandedGroups(prev => prev.includes(label) ? prev.filter(item => item !== label) : [...prev, label]);
  };

  const handleExpandSidebar = () => {
    setExpanded(true);
  };

  return (
    <aside className={cn(
      "h-screen sticky top-0 border-r border-border", 
      expanded ? "w-64" : "w-20"
    )}>
      <nav className="h-full flex flex-col bg-gray-50">
        <SidebarHeader expanded={expanded} setExpanded={setExpanded} searchTerm={searchTerm} setSearchTerm={setSearchTerm} />
        
        <SidebarContent 
          items={menuItems} 
          expanded={expanded} 
          expandedGroups={expandedGroups} 
          toggleGroup={toggleGroup} 
          searchTerm={searchTerm} 
          onExpandSidebar={handleExpandSidebar} 
        />
        
        <SidebarFooter expanded={expanded} profile={profile} />
      </nav>
    </aside>
  );
}
