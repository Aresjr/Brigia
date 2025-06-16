import { PatientTable } from "@/components/DataTable/PatientTable";
import { FormDialog } from "@/components/Forms/FormDialog";
import { useLocation } from "react-router-dom";
import { usePatientManagement } from "@/hooks/usePatientManagement";

const Patients = () => {
    const location = useLocation();
    const {
        items,
        isLoading,
        error,
        selectedItems,
        editingItem,
        formError,
        isFormOpen,
        setIsFormOpen,
        handleDelete,
        handleNewRecord,
        handleEdit,
        handleToggleItem,
        selectAll,
        selectNone
    } = usePatientManagement();

    return (
        <>
            <div className="space-y-4 table-fixed w-full">
                <PatientTable
                    items={items}
                    isLoading={isLoading}
                    error={error}
                    pathname={location.pathname}
                    selectedItems={selectedItems}
                    onToggleItem={handleToggleItem}
                    onSelectAll={selectAll}
                    onSelectNone={selectNone}
                    onNewRecord={handleNewRecord}
                    onEdit={handleEdit}
                    onDelete={handleDelete}
                    formError={formError}
                />
            </div>
            <FormDialog
                isOpen={isFormOpen}
                onOpenChange={setIsFormOpen}
                pathname={location.pathname}
                editingItem={editingItem}
            />
        </>
    );
};

export default Patients;
