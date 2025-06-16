import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { toast } from "sonner";
import { Loader2, Mail, Lock } from "lucide-react";
import { login } from "@/api/auth.ts";

export default function AuthPage() {
  const [loading, setLoading] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      await login(email, password);
      navigate("/");
    } catch (error: any) {
      console.log("toast.error");
      toast.error( error.detail.message || 'Não foi possível fazer o login', {
        style: {
          backgroundColor: 'green',
          color: 'white'
        }
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-200">
      <Card className="w-full max-w-md">
        <CardHeader className="space-y-3">
          <div className="flex justify-center mb-2">
            <div className="h-28 flex items-center justify-center">
              <img 
                src="/bem-estar-saude-logo.png" 
                alt="Bem Estar Saúde Logo" 
                className="w-full h-full object-contain"
              />
            </div>
          </div>
        </CardHeader>
        
        <form onSubmit={handleLogin}>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <div className="relative">
                <Mail className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
                <Input 
                  id="email" 
                  type="email" 
                  placeholder="m@example.com" 
                  value={email} 
                  onChange={(e) => setEmail(e.target.value)} 
                  className="pl-10"
                  required 
                />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="password">Senha</Label>
              <div className="relative">
                <Lock className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
                <Input 
                  id="password" 
                  type="password" 
                  value={password} 
                  onChange={(e) => setPassword(e.target.value)} 
                  className="pl-10"
                  required 
                />
              </div>
            </div>
          </CardContent>
          <CardFooter>
            <Button className="w-full" type="submit" disabled={loading}>
              {loading ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
              Login
            </Button>
          </CardFooter>
        </form>
      </Card>
    </div>
  );
}
