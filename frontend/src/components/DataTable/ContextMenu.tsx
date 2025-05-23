
import { Button } from "@/components/ui/button";
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle } from "@/components/ui/alert-dialog";
import { Edit, Trash } from "lucide-react";
import { useState } from "react";
import {VisuallyHidden} from "@radix-ui/react-visually-hidden";

interface ContextMenuProps {
  x: number;
  y: number;
  onClose: () => void;
  onEdit: () => void;
  onDelete: () => void;
}

export const ContextMenu = ({ x, y, onClose, onEdit, onDelete }: ContextMenuProps) => {
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);

  return (
    <>
      <div 
        className="fixed bg-background dark:bg-muted rounded-md shadow-lg border p-1 min-w-[160px] z-50"
        style={{ 
          top: `${y}px`, 
          left: `${x}px`,
          transform: 'translate(-50%, -50%)'
        }}
      >
        <Button
          variant="ghost"
          className="w-full justify-start"
          onClick={() => {
            onClose();
            onEdit();
          }}
        >
          <Edit className="mr-2 h-4 w-4" /> Editar
        </Button>
        <Button
          variant="ghost"
          className="w-full justify-start text-destructive"
          onClick={() => {
            setShowDeleteDialog(true);
          }}
        >
          <Trash className="mr-2 h-4 w-4" /> Excluir
        </Button>
      </div>

      <AlertDialog open={showDeleteDialog} onOpenChange={setShowDeleteDialog}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Tem certeza?</AlertDialogTitle>
              <VisuallyHidden>
                  <AlertDialogDescription>
                      Essa ação não pode ser desfeita
                  </AlertDialogDescription>
              </VisuallyHidden>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel onClick={() => setShowDeleteDialog(false)}>Cancelar</AlertDialogCancel>
            <AlertDialogAction
              onClick={() => {
                onDelete();
                setShowDeleteDialog(false);
                onClose();
              }}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
            >
              Excluir
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </>
  );
};
