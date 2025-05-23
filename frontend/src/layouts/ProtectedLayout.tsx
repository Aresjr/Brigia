import React, { useEffect, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import Sidebar from "@/components/Sidebar";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { useQueryClient } from "@tanstack/react-query";

type ProtectedLayoutProps = {
  children: React.ReactNode;
};

const ProtectedLayout = ({
  children
}: ProtectedLayoutProps) => {
  const navigate = useNavigate();
  const location = useLocation();
  const queryClient = useQueryClient();
  const [userId, setUserId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [sidebarExpanded, setSidebarExpanded] = useState(true);
  
  const prevPathRef = React.useRef(location.pathname);
  
  useEffect(() => {
    const checkSession = async () => {
      try {
        const {
          data: {
            session
          }
        } = await supabase.auth.getSession();
        if (!session) {
          navigate("/auth");
          return;
        }
        setUserId(session.user.id);
        setLoading(false);
      } catch (error) {
        console.error("Erro ao verificar a sessão:", error);
        toast.error("Erro na autenticação. Tente entrar novamente.");
        navigate("/auth");
      }
    };
    checkSession();
    const {
      data: authListener
    } = supabase.auth.onAuthStateChange(async (event, session) => {
      if (event === "SIGNED_OUT") {
        navigate("/auth");
      } else if (session) {
        setUserId(session.user.id);
        setLoading(false);
      }
    });
    return () => {
      authListener.subscription.unsubscribe();
    };
  }, [navigate]);
  const handleSidebarExpand = (expanded: boolean) => {
    setSidebarExpanded(expanded);
  };

  if (loading) {
    return <div className="flex items-center justify-center h-screen">
        <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-primary"></div>
      </div>;
  }

  return <div className="flex min-h-screen bg-background">
      <Sidebar onExpand={handleSidebarExpand} />
      <div className="flex-1 px-[32px] pb-12 bg-gray-200">
        {children}
      </div>
    </div>;
};

export default ProtectedLayout;
