'use client';

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Cake } from "lucide-react";

export default function Home() {
  return (
    <div className="space-y-8">
      <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
        <div className="flex items-center justify-between bg-gray-50">
          <h1 className="text-2xl font-bold">Página Inicial</h1>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card>
          <CardContent className="pt-6">
            <div className="text-2xl font-bold">0</div>
            <div className="text-sm text-muted-foreground">Total de Pacientes</div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-lg flex items-center">
              <Cake className="h-5 w-5 mr-2 text-blue-500" />
              Aniversariantes de Hoje
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-sm text-muted-foreground">
              Carregando...
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
