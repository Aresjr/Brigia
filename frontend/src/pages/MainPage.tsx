import { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { MessageSquare } from "lucide-react";
import { supabase } from "@/integrations/supabase/client";
import ProtectedLayout from "@/layouts/ProtectedLayout";
import {getPageTitle} from "@/models/pages";
import { DataItem } from "@/models/models";
import { ChatDialog } from "@/components/Chat/ChatDialog";
import { FormDialog } from "@/components/Forms/FormDialog";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Sun, Moon } from "lucide-react";
import { useTheme } from "next-themes";
import { Profile } from "@/components/Sidebar/types.ts";
import { useToast } from "@/hooks/use-toast";
import { toast } from "sonner";
import {getSession} from "@/api/auth.ts";
import Index from "./Index";
import Patients from "./Patients";
import MedicalPlans from "./MedicalPlans";

const MainPage = () => {
    const location = useLocation();
    const [isChatOpen, setIsChatOpen] = useState(false);
    const [isFormOpen, setIsFormOpen] = useState(false);
    const [isSettingsOpen, setIsSettingsOpen] = useState(false);
    const [editingItem, setEditingItem] = useState<DataItem | null>(null);
    const [profile, setProfile] = useState<Profile | null>(null);
    const { theme, setTheme } = useTheme();
    const { toast: toastError } = useToast();

    useEffect(() => {
        const pageTitle = getPageTitle(location.pathname);
        document.title = `Bem Estar Saúde ${pageTitle ? '- ' + pageTitle : ''}`;
    }, [location.pathname]);

    const updateSettings = async (key: keyof Profile, value: string) => {
        try {
            const session = await getSession();
            if (!session?.user) return;

            const {
                error
            } = await supabase.from('profiles').update({
                [key]: value
            }).eq('user_id', session.user.id);
            if (error) throw error;
            setProfile(prev => prev ? {
                ...prev,
                [key]: value
            } : null);
            if (key === 'theme') {
                setTheme(value);
            }
            toast.success('Configurações salvas');
        } catch (error: any) {
            toastError({
                description: 'Erro ao atualizar as configurações',
                variant: "destructive"
            });
        }
    };

    const getPageContent = () => {
        switch (location.pathname) {
          case '/':
            return <Index />;
          case '/pacientes':
            return <Patients />;
          case '/convenios':
            return <MedicalPlans />;
        }
      };

    return (
        <ProtectedLayout>
            <div className="space-y-4 relative">
                
                { getPageContent() }

                <Button className="fixed bottom-4 right-4 rounded-full shadow-lg" size="icon" onClick={() => setIsChatOpen(true)}>
                    <MessageSquare className="h-4 w-4" />
                </Button>

                <ChatDialog isOpen={isChatOpen} onOpenChange={setIsChatOpen} />

                <FormDialog isOpen={isFormOpen} onOpenChange={setIsFormOpen} pathname={location.pathname} editingItem={editingItem} />

                <Dialog open={isSettingsOpen} onOpenChange={setIsSettingsOpen}>
                    <DialogContent>
                        <DialogHeader>
                            <DialogTitle>Configurações</DialogTitle>
                            <DialogDescription>
                                Altere suas Configurações
                            </DialogDescription>
                        </DialogHeader>
                        <div className="space-y-6">
                            <div className="space-y-2">
                                <Label>Tema</Label>
                                <Select value={profile?.theme || theme} onValueChange={value => updateSettings('theme', value)}>
                                    <SelectTrigger>
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="light">
                                            <div className="flex items-center gap-2">
                                                <Sun className="h-4 w-4" />
                                                <span>Claro</span>
                                            </div>
                                        </SelectItem>
                                        <SelectItem value="dark">
                                            <div className="flex items-center gap-2">
                                                <Moon className="h-4 w-4" />
                                                <span>Escuro</span>
                                            </div>
                                        </SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                        </div>
                    </DialogContent>
                </Dialog>
            </div>
        </ProtectedLayout>
    );
};

export default MainPage;
