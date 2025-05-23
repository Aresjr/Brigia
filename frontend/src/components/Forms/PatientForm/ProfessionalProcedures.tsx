
import { useState, useEffect } from "react";
import { CheckboxGroup, CheckboxItem } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";
import { Procedure } from "@/models/models";
import { getProcedures, getProfessionalProcedures } from "@/services/dbService";

interface ProfessionalProceduresProps {
  professionalId?: number | string;
  onProceduresChange: (procedureIds: number[]) => void;
}

export const ProfessionalProcedures = ({ professionalId, onProceduresChange }: ProfessionalProceduresProps) => {
  const [procedures, setProcedures] = useState<Procedure[]>([]);
  const [selectedProcedures, setSelectedProcedures] = useState<number[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      try {
        // Fetch all available procedures
        const allProcedures = await getProcedures();
        setProcedures(allProcedures);

        // If we have a professional ID, fetch their procedures
        if (professionalId && typeof professionalId === 'number') {
          const professionalProcedures = await getProfessionalProcedures(professionalId);
          setSelectedProcedures(professionalProcedures);
        }
      } catch (error) {
        console.error("Error fetching procedures:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [professionalId]);

  const handleCheckboxChange = (procedureId: number, checked: boolean) => {
    const updatedSelection = checked
      ? [...selectedProcedures, procedureId]
      : selectedProcedures.filter(id => id !== procedureId);
    
    setSelectedProcedures(updatedSelection);
    onProceduresChange(updatedSelection);
  };

  if (loading) {
    return <div>Carregando procedimentos...</div>;
  }

  return (
    <div className="space-y-4">
      <h3 className="text-lg font-medium">Procedimentos</h3>
      
      {procedures.length === 0 ? (
        <p className="text-muted-foreground">Nenhum procedimento cadastrado.</p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-2">
          {procedures.map((procedure) => (
            <div key={procedure.id} className="flex items-start space-x-2">
              <input 
                type="checkbox"
                id={`procedure-${procedure.id}`}
                checked={selectedProcedures.includes(procedure.id)}
                onChange={(e) => handleCheckboxChange(procedure.id, e.target.checked)}
              />
              <Label htmlFor={`procedure-${procedure.id}`} className="cursor-pointer">
                {procedure.description}
              </Label>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};
