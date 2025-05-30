import { useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar";
import { UserCircle, Settings, LogOut } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { cn } from "@/lib/utils";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Profile } from "./types";
import { clearSession } from "@/api";

interface SidebarFooterProps {
  expanded: boolean;
  profile: Profile | null;
}

export const SidebarFooter = ({ expanded, profile }: SidebarFooterProps) => {
  const navigate = useNavigate();

  const handleLogout = async () => {
    const { error } = await supabase.auth.signOut();
    if (error) {
      toast.error(error.message);
    } else {
      clearSession();
      navigate("/auth");
    }
  };

  return (
    <div className="border-t border-border p-3">
      <DropdownMenu>
        <DropdownMenuTrigger asChild>
          <Button
            variant="ghost"
            className={cn(
              "w-full justify-start",
              expanded ? "" : "justify-center"
            )}
          >
            <Avatar className="h-6 w-6">
              <AvatarImage src={profile?.avatar_url || ""} />
              <AvatarFallback>
                <UserCircle className="h-4 w-4" />
              </AvatarFallback>
            </Avatar>
            {expanded && (
              <span className="ml-2">{profile?.name || "Usuário"}</span>
            )}
          </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent align="start" className="w-48">
          <DropdownMenuItem onClick={() => navigate("/configuracoes")}>
            <Settings className="mr-2 h-4 w-4" />
            Configurações
          </DropdownMenuItem>
          <DropdownMenuItem onClick={handleLogout}>
            <LogOut className="mr-2 h-4 w-4" />
            Sair
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
    </div>
  );
};
