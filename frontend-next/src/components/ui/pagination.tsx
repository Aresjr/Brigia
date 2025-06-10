"use client"

import * as React from "react"
import { ChevronLeftIcon, ChevronRightIcon } from "lucide-react"

import { cn } from "@/lib/utils"
import { buttonVariants } from "@/components/ui/button"

interface PaginationProps {
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
}

export function Pagination({ currentPage, totalPages, onPageChange }: PaginationProps) {
  return (
    <div className="flex justify-end space-x-6">
      <div className="flex w-[100px] items-center justify-center text-sm font-medium">
        Página {currentPage} de {totalPages}
      </div>
      <nav className="flex items-center space-x-1">
        <button
          onClick={() => onPageChange(currentPage - 1)}
          disabled={currentPage <= 1}
          className={cn(
            buttonVariants({ variant: "outline" }),
            "h-8 w-8 p-0",
            currentPage <= 1 && "opacity-50 cursor-not-allowed"
          )}
        >
          <ChevronLeftIcon className="h-4 w-4" />
          <span className="sr-only">Página anterior</span>
        </button>
        <button
          onClick={() => onPageChange(currentPage + 1)}
          disabled={currentPage >= totalPages}
          className={cn(
            buttonVariants({ variant: "outline" }),
            "h-8 w-8 p-0",
            currentPage >= totalPages && "opacity-50 cursor-not-allowed"
          )}
        >
          <ChevronRightIcon className="h-4 w-4" />
          <span className="sr-only">Próxima página</span>
        </button>
      </nav>
    </div>
  )
}
