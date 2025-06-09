import { DataTable } from "@/components/DataTable/DataTable";
import { FormDialog } from "@/components/Forms/FormDialog";
import { usePatientManagement } from "@/hooks/usePatientManagement";

const Patients = () => {
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
            <DataTable
                key={items.length}
                items={items}
                isLoading={isLoading}
                error={error as Error}
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
