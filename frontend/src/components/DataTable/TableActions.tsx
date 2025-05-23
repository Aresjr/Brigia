
import {Download, X, ChevronDown, UserX, PlusIcon} from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
} from "@/components/ui/dropdown-menu";
import { useNavigate } from "react-router-dom";

interface TableActionsProps {
  selectedItems: string[];
  onNewRecord: () => void;
  onExportSelected: () => void;
  onDeleteSelected: () => void;
  pathname: string;
}

export const TableActions = ({
  selectedItems,
  onNewRecord,
  onExportSelected,
  onDeleteSelected,
  pathname
}: TableActionsProps) => {
  let navigate = useNavigate(); 
  const deletedPatientsPage = () =>{ 
    let path = `pacientes-excluidos`; 
    navigate(path);
  }

  return (
    <div className="flex items-center">
      {pathname === "/pacientes" && (
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button className="gap-2 bg-[#524ED2] hover:bg-[#433FAB] ">
              Opções
              <ChevronDown className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-56 bg-white">
            <DropdownMenuItem onClick={deletedPatientsPage} className="cursor-pointer">
              <UserX className="mr-2 h-4 w-4" />
              Mostrar Pacientes Excluídos
            </DropdownMenuItem>
            
            {selectedItems.length > 0 && (
              <>
                <DropdownMenuSeparator />
                <DropdownMenuItem onClick={onExportSelected} className="cursor-pointer">
                  <Download className="mr-2 h-4 w-4" />
                  Exportar
                </DropdownMenuItem>
                <DropdownMenuItem onClick={onDeleteSelected} className={`cursor-pointer text-red-500`}>
                  <X className="mr-2 h-4 w-4" />
                  Excluir
                </DropdownMenuItem>
              </>
            )}
          </DropdownMenuContent>
        </DropdownMenu>
      )}
      
      <Button onClick={onNewRecord} className="ml-2 bg-green-500 hover:bg-green-600 gap-2">
        <PlusIcon className="h-4 w-4" />
        <span className="hidden sm:block">
          Adicionar
        </span>
      </Button>
    </div>
  );
};
