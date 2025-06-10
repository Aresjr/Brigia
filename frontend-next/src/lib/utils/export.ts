import Papa from 'papaparse';

export interface ExportConfig {
    excludeFields?: string[];
    customFormatters?: { [key: string]: (value: any) => string };
    filename?: string;
}

export function exportToCSV<T extends Record<string, any>>(
    data: T[],
    config: ExportConfig = {}
) {
    const {
        excludeFields = ['id', 'address'],
        customFormatters = {},
        filename = `export-${new Date().toISOString()}.csv`
    } = config;

    // Get all unique keys excluding specified fields
    const allKeys = new Set<string>();
    data.forEach(item => {
        Object.keys(item).forEach(key => {
            if (!excludeFields.includes(key) && typeof item[key] !== 'object') {
                allKeys.add(key);
            }
        });
    });

    const headers = Array.from(allKeys);

    // Format data for CSV
    const formattedData = data.map(item => {
        return headers.map(header => {
            const value = item[header];
            if (customFormatters[header]) {
                return customFormatters[header](value);
            }
            if (value === null || value === undefined) {
                return '';
            }
            return String(value);
        });
    });

    // Create and download CSV
    const csv = Papa.unparse({
        fields: headers,
        data: formattedData
    });

    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
