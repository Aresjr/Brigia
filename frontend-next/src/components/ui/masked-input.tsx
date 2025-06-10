'use client';

import { Input, InputProps } from "@/components/ui/input";
import { forwardRef, useEffect, useState } from "react";

interface MaskedInputProps extends Omit<InputProps, 'onChange'> {
    mask: string;
    onChange?: (value: string) => void;
}

export const MaskedInput = forwardRef<HTMLInputElement, MaskedInputProps>(
    ({ mask, value = "", onChange, ...props }, ref) => {
        const [inputValue, setInputValue] = useState(value as string);

        const applyMask = (value: string): string => {
            let masked = "";
            let valueIndex = 0;

            for (let i = 0; i < mask.length && valueIndex < value.length; i++) {
                if (mask[i] === '#') {
                    if (/\d/.test(value[valueIndex])) {
                        masked += value[valueIndex];
                        valueIndex++;
                    }
                } else if (mask[i] === 'A') {
                    if (/[a-zA-Z]/.test(value[valueIndex])) {
                        masked += value[valueIndex];
                        valueIndex++;
                    }
                } else {
                    masked += mask[i];
                    if (value[valueIndex] === mask[i]) {
                        valueIndex++;
                    }
                }
            }
            return masked;
        };

        const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
            const raw = e.target.value.replace(/[^0-9a-zA-Z]/g, "");
            const masked = applyMask(raw);
            setInputValue(masked);
            onChange?.(masked);
        };

        useEffect(() => {
            if (value !== inputValue) {
                setInputValue(value as string);
            }
        }, [value]);

        return (
            <Input
                {...props}
                ref={ref}
                value={inputValue}
                onChange={handleChange}
            />
        );
    }
);
