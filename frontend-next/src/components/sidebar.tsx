'use client';

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import Image from "next/image";
import { Home, Users, Building2 } from "lucide-react";

const navigation = [
  { name: 'Página Inicial', href: '/', icon: Home },
  { name: 'Pacientes', href: '/pacientes', icon: Users },
  { name: 'Convênios', href: '/convenios', icon: Building2 },
];

export function Sidebar() {
  const pathname = usePathname();

  return (
    <div className="flex h-full w-56 flex-col bg-white">
      <div className="flex h-16 shrink-0 items-center px-6 border-b">
        <Image
          className="h-8 w-auto"
          src="/bem-estar-saude-logo-sidebar.png"
          alt="Logo"
          width={160}
          height={32}
          priority
        />
      </div>
      <nav className="flex flex-1 flex-col">
        <ul role="list" className="flex flex-1 flex-col gap-y-7 p-4">
          <li>
            <ul role="list" className="-mx-2 space-y-1">
              {navigation.map((item) => {
                const Icon = item.icon;
                return (
                  <li key={item.name}>
                    <Link
                      href={item.href}
                      className={cn(
                        pathname === item.href
                          ? 'bg-gray-50 text-blue-600'
                          : 'text-gray-700 hover:text-blue-600 hover:bg-gray-50',
                        'group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold'
                      )}
                    >
                      <Icon className="h-6 w-6 shrink-0" aria-hidden="true" />
                      {item.name}
                    </Link>
                  </li>
                );
              })}
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  );
}
