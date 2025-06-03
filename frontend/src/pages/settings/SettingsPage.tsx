
import { useState, useEffect } from "react";
import { useToast } from "@/hooks/use-toast";
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { supabase } from "@/integrations/supabase/client";
import { Profile } from "@/components/Sidebar/types";
import { UserCircle } from "lucide-react";
import {getSession} from "@/api/auth.ts";

const SettingsPage = () => {
  const { toast } = useToast();
  const [profile, setProfile] = useState<Profile | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [name, setName] = useState('');
  const [establishment, setEstablishment] = useState('');
  const [role, setRole] = useState('');

  useEffect(() => {
    document.title = "Bem Estar Saúde - Configurações";
  }, []);

  useEffect(() => {
    const fetchProfile = async () => {
      setIsLoading(true);
      try {
        const session = await getSession();

        if (!session?.user) return;

        setProfile(session.profile);
        setName(session.profile.name || '');
        setEstablishment(session.profile.establishment || '');
        setRole(session.profile.role || '');
      } finally {
        setIsLoading(false);
      }
    };

    fetchProfile();
  }, []);

  const handleAvatarChange = async (file: File | null) => {
    if (!file || !profile) return;

    try {
      const fileName = `avatar_${Date.now()}_${file.name}`;
      // Upload the file to Supabase storage
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('avatars')
        .upload(fileName, file);

      if (uploadError) {
        console.error('Error uploading avatar:', uploadError);
        toast({
          title: "Error",
          description: "Failed to upload avatar",
          variant: "destructive"
        });
        return;
      }

      // Get the public URL of the uploaded file
      const { data: { publicUrl } } = supabase.storage
        .from('avatars')
        .getPublicUrl(fileName);

      // Update the profile with the new avatar URL
      const { error: updateError } = await supabase
        .from('profiles')
        .update({ avatar_url: publicUrl })
        .eq('id', typeof profile.id === 'string' ? parseInt(profile.id, 10) : profile.id);

      if (updateError) {
        console.error('Error updating profile:', updateError);
        toast({
          title: "Error",
          description: "Failed to update profile with new avatar",
          variant: "destructive"
        });
        return;
      }

      setProfile({ ...profile, avatar_url: publicUrl });
      toast({
        description: "Avatar updated successfully"
      });
    } catch (error) {
      console.error('Error in avatar change process:', error);
      toast({
        title: "Error",
        description: "An error occurred while updating your avatar",
        variant: "destructive"
      });
    }
  };

  const handleNameChange = async () => {
    if (!profile) return;

    try {
      const { error } = await supabase
        .from('profiles')
        .update({ name: name })
        .eq('id', typeof profile.id === 'string' ? parseInt(profile.id, 10) : profile.id);

      if (error) {
        console.error('Error updating name:', error);
        toast({
          title: "Error",
          description: "Failed to update name",
          variant: "destructive"
        });
      } else {
        setProfile({ ...profile, name: name });
        toast({
          description: "Name updated successfully"
        });
      }
    } catch (error) {
      console.error('Error in name change process:', error);
      toast({
        title: "Error",
        description: "An error occurred while updating your name",
        variant: "destructive"
      });
    }
  };

    const handleEstablishmentChange = async () => {
        if (!profile) return;

        try {
            const { error } = await supabase
                .from('profiles')
                .update({ establishment: establishment })
                .eq('id', typeof profile.id === 'string' ? parseInt(profile.id, 10) : profile.id);

            if (error) {
                console.error('Error updating establishment:', error);
                toast({
                    title: "Error",
                    description: "Failed to update establishment",
                    variant: "destructive"
                });
            } else {
                setProfile({ ...profile, establishment: establishment });
                toast({
                    description: "Establishment updated successfully"
                });
            }
        } catch (error) {
            console.error('Error in establishment change process:', error);
            toast({
                title: "Error",
                description: "An error occurred while updating your establishment",
                variant: "destructive"
            });
        }
    };

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Configurações</h1>

      <div className="flex items-center gap-4 mb-6">
        <Avatar className="h-16 w-16">
          {profile?.avatar_url ? (
            <AvatarImage src={profile?.avatar_url} alt="Avatar" />
          ) : (
            <AvatarFallback className="bg-primary/10">
              <UserCircle className="h-8 w-8 text-primary" />
            </AvatarFallback>
          )}
        </Avatar>
        <div className="space-y-1">
          <p className="text-sm font-medium leading-none">Foto de Perfil</p>
          <Input
            type="file"
            id="avatar-input"
            className="hidden"
            onChange={(e) => {
              const file = (e.target.files as FileList)[0];
              handleAvatarChange(file);
            }}
          />
          <Label htmlFor="avatar-input" className="bg-secondary text-secondary-foreground hover:bg-secondary/80 rounded-md px-4 py-2 text-sm font-medium">
            Alterar Foto
          </Label>
        </div>
      </div>

      <div className="grid gap-4">
        <div>
          <Label htmlFor="name">Nome</Label>
          <Input
            type="text"
            id="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            onBlur={handleNameChange}
          />
        </div>

          <div>
              <Label htmlFor="establishment">Estabelecimento</Label>
              <Input
                  type="text"
                  id="establishment"
                  value={establishment}
                  onChange={(e) => setEstablishment(e.target.value)}
                  onBlur={handleEstablishmentChange}
              />
          </div>

        <div>
          <Label htmlFor="role">Função</Label>
          <Input
            type="text"
            id="role"
            value={role}
            onChange={(e) => setRole(e.target.value)}
            disabled
          />
        </div>
      </div>
    </div>
  );
};

export default SettingsPage;
