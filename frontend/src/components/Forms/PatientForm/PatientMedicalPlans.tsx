
import React, { useState } from "react";
import { DataItem, PatientMedicalPlan } from "@/models/models";
import { Card, CardContent, CardHeader, CardTitle, CardFooter } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { PlusCircle, Trash2, Edit, Calendar } from "lucide-react";
import {Select, SelectContent, SelectItem, SelectTrigger, SelectValue,} from "@/components/ui/select";
import { format, isValid, parse } from "date-fns";
import { ptBR } from "date-fns/locale";
import InputMask from "react-input-mask";

interface PatientMedicalPlansProps {
    formData: Partial<DataItem>;
    setFormData: (data: Partial<DataItem>) => void;
    medicalPlans: Array<{ id: number; name: string }>;
    errors: Record<string, string>;
}

export const PatientMedicalPlans = ({
                                        formData,
                                        setFormData,
                                        medicalPlans,
                                        errors,
                                    }: PatientMedicalPlansProps) => {
    const [editingPlan, setEditingPlan] = useState<PatientMedicalPlan | null>(null);
    const [editIndex, setEditIndex] = useState<number | null>(null);
    const [showForm, setShowForm] = useState(false);

    // Initialize the medical plans array if it doesn't exist
    const plans = formData.medical_plans || [];

    // Initial state for a new plan
    const initialPlanState: PatientMedicalPlan = {
        patient_id: Number(formData.id) || 0,
        medical_plan_id: 0,
        description: "",
        card_number: "",
        expiration_date: "",
        holder_name: "",
    };

    const [currentPlan, setCurrentPlan] = useState<PatientMedicalPlan>(initialPlanState);

    const handleAddOrUpdatePlan = () => {
        if (!currentPlan.medical_plan_id) {
            alert("Por favor, selecione um convênio.");
            return;
        }

        // Find plan name for display purposes
        const planName = medicalPlans.find(p => p.id === currentPlan.medical_plan_id)?.name || "";

        const updatedPlans = [...plans];

        if (editIndex !== null) {
            // Update existing plan
            updatedPlans[editIndex] = {
                ...currentPlan,
                medical_plan_name: planName
            };
        } else {
            // Add new plan
            updatedPlans.push({
                ...currentPlan,
                medical_plan_name: planName
            });
        }

        setFormData({
            ...formData,
            medical_plans: updatedPlans
        });

        setCurrentPlan(initialPlanState);
        setEditingPlan(null);
        setEditIndex(null);
        setShowForm(false);
    };

    const handleEditPlan = (plan: PatientMedicalPlan, index: number) => {
        setCurrentPlan(plan);
        setEditingPlan(plan);
        setEditIndex(index);
        setShowForm(true);
    };

    const handleRemovePlan = (index: number) => {
        const updatedPlans = [...plans];
        updatedPlans.splice(index, 1);
        setFormData({
            ...formData,
            medical_plans: updatedPlans
        });
    };

    const formatExpirationDate = (date: string | undefined): string => {
        if (!date) return "";

        try {
            // Handle different date formats
            if (date.includes('/')) {
                const [day, month, year] = date.split('/').map(Number);
                const parsedDate = new Date(year, month - 1, day);
                return isValid(parsedDate)
                    ? format(parsedDate, 'dd/MM/yyyy', { locale: ptBR })
                    : date;
            }

            const parsedDate = new Date(date);
            return isValid(parsedDate)
                ? format(parsedDate, 'dd/MM/yyyy', { locale: ptBR })
                : date;
        } catch (error) {
            console.error("Error formatting date:", error);
            return date;
        }
    };

    return (
        <div className="space-y-4">
            <h3 className="text-lg font-medium">Convênios do Paciente</h3>

            {plans.length > 0 ? (
                <div className="space-y-3">
                    {plans.map((plan, index) => (
                        <Card key={index} className="border border-gray-200">
                            <CardHeader className="py-3">
                                <CardTitle className="text-base flex justify-between items-center">
                                    <span>{plan.name}</span>
                                    <div className="flex gap-2">
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            onClick={() => handleEditPlan(plan, index)}
                                        >
                                            <Edit className="h-4 w-4" />
                                        </Button>
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            onClick={() => handleRemovePlan(index)}
                                            className="text-destructive hover:text-destructive"
                                        >
                                            <Trash2 className="h-4 w-4" />
                                        </Button>
                                    </div>
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="py-2 px-6">
                                <div className="grid grid-cols-2 gap-3 text-sm">
                                    {plan.card_number && (
                                        <div>
                                            <span className="font-medium">Carteirinha:</span> {plan.card_number}
                                        </div>
                                    )}
                                    {plan.expiration_date && (
                                        <div className="flex items-center gap-1">
                                            <Calendar className="h-3 w-3" />
                                            <span className="font-medium">Validade:</span> {formatExpirationDate(plan.expiration_date)}
                                        </div>
                                    )}
                                    {plan.holder_name && (
                                        <div className="col-span-2">
                                            <span className="font-medium">Titular:</span> {plan.holder_name}
                                        </div>
                                    )}
                                    {plan.description && (
                                        <div className="col-span-2">
                                            <span className="font-medium">Descrição:</span> {plan.description}
                                        </div>
                                    )}
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            ) : (
                <div className="text-muted-foreground italic py-2">
                    Nenhum convênio adicionado.
                </div>
            )}

            {!showForm ? (
                <Button
                    variant="outline"
                    onClick={() => setShowForm(true)}
                    className="w-full"
                >
                    <PlusCircle className="mr-2 h-4 w-4" />
                    Adicionar Convênio
                </Button>
            ) : (
                <Card className="border border-gray-200">
                    <CardHeader className="py-3">
                        <CardTitle className="text-base">
                            {editingPlan ? "Editar Convênio" : "Adicionar Convênio"}
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div>
                            <Label htmlFor="medical_plan_id">Convênio*</Label>
                            <Select
                                value={currentPlan.medical_plan_id ? String(currentPlan.medical_plan_id) : ""}
                                onValueChange={(value) => {
                                    setCurrentPlan({
                                        ...currentPlan,
                                        medical_plan_id: Number(value)
                                    });
                                }}
                            >
                                <SelectTrigger className="w-full">
                                    <SelectValue placeholder="Selecione um convênio" />
                                </SelectTrigger>
                                <SelectContent>
                                    {medicalPlans.map((plan) => (
                                        <SelectItem key={plan.id} value={String(plan.id)}>
                                            {plan.name}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div>
                            <Label htmlFor="card_number">Número da Carteirinha</Label>
                            <Input
                                id="card_number"
                                value={currentPlan.card_number || ""}
                                onChange={(e) => {
                                    // Allow only numbers
                                    const value = e.target.value.replace(/\D/g, '');
                                    setCurrentPlan({
                                        ...currentPlan,
                                        card_number: value.substring(0, 32) // Limit to 32 digits
                                    });
                                }}
                                placeholder="Apenas números"
                                maxLength={32}
                            />
                        </div>

                        <div>
                            <Label htmlFor="expiration_date">Validade</Label>
                            <InputMask
                                mask="99/99/9999"
                                value={currentPlan.expiration_date || ""}
                                onChange={(e) => {
                                    setCurrentPlan({
                                        ...currentPlan,
                                        expiration_date: e.target.value
                                    });
                                }}
                            >
                                {(inputProps: any) => (
                                    <Input
                                        {...inputProps}
                                        id="expiration_date"
                                        placeholder="DD/MM/AAAA"
                                    />
                                )}
                            </InputMask>
                        </div>

                        <div>
                            <Label htmlFor="holder_name">Titular</Label>
                            <Input
                                id="holder_name"
                                value={currentPlan.holder_name || ""}
                                onChange={(e) => {
                                    setCurrentPlan({
                                        ...currentPlan,
                                        holder_name: e.target.value
                                    });
                                }}
                                placeholder="Nome do titular (se diferente do paciente)"
                            />
                        </div>

                        <div>
                            <Label htmlFor="description">Descrição</Label>
                            <Textarea
                                id="description"
                                value={currentPlan.description || ""}
                                onChange={(e) => {
                                    setCurrentPlan({
                                        ...currentPlan,
                                        description: e.target.value
                                    });
                                }}
                                placeholder="Observações adicionais sobre o convênio"
                                rows={3}
                            />
                        </div>
                    </CardContent>
                    <CardFooter className="flex justify-end gap-2 pt-0">
                        <Button
                            variant="outline"
                            onClick={() => {
                                setShowForm(false);
                                setCurrentPlan(initialPlanState);
                                setEditingPlan(null);
                                setEditIndex(null);
                            }}
                        >
                            Cancelar
                        </Button>
                        <Button onClick={handleAddOrUpdatePlan}>
                            {editingPlan ? "Atualizar" : "Adicionar"}
                        </Button>
                    </CardFooter>
                </Card>
            )}
        </div>
    );
};
