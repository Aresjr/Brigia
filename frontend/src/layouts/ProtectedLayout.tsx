import React, { useEffect, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import Sidebar from "@/components/Sidebar";
import { toast } from "sonner";
import { useQueryClient } from "@tanstack/react-query";
import { isLogged, getSession } from '../api';

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
        const logged = await isLogged();
        if (!logged) {
          toast.error("Você deve se autenticar para ver essa página");
          navigate("/auth");
          return;
        }
        const session = getSession();
        setUserId(session.user.id);
        setLoading(false);
      } catch (error) {
        console.error("Erro ao verificar a sessão:", error);
        toast.error("Você deve se autenticar para ver essa página");
        navigate("/auth");
      }
    };
    checkSession();
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
