export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      a_appointment: {
        Row: {
          cost: number | null
          created_at: string
          description: string | null
          end_date: string
          id: number
          is_deleted: boolean | null
          is_paid: boolean | null
          medical_plan_id: number | null
          patient_id: number
          professional_id: number
          start_date: string
        }
        Insert: {
          cost?: number | null
          created_at?: string
          description?: string | null
          end_date: string
          id?: number
          is_deleted?: boolean | null
          is_paid?: boolean | null
          medical_plan_id?: number | null
          patient_id: number
          professional_id: number
          start_date: string
        }
        Update: {
          cost?: number | null
          created_at?: string
          description?: string | null
          end_date?: string
          id?: number
          is_deleted?: boolean | null
          is_paid?: boolean | null
          medical_plan_id?: number | null
          patient_id?: number
          professional_id?: number
          start_date?: string
        }
        Relationships: [
          {
            foreignKeyName: "a_appointment_medical_plan_id_fkey"
            columns: ["medical_plan_id"]
            isOneToOne: false
            referencedRelation: "medical_plans"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "a_appointment_patient_id_fkey"
            columns: ["patient_id"]
            isOneToOne: false
            referencedRelation: "patients"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "a_appointment_professional_id_fkey"
            columns: ["professional_id"]
            isOneToOne: false
            referencedRelation: "professionals"
            referencedColumns: ["id"]
          },
        ]
      }
      a_procedures: {
        Row: {
          created_at: string
          description: string
          id: number
          is_deleted: boolean | null
        }
        Insert: {
          created_at?: string
          description: string
          id?: number
          is_deleted?: boolean | null
        }
        Update: {
          created_at?: string
          description?: string
          id?: number
          is_deleted?: boolean | null
        }
        Relationships: []
      }
      medical_plans: {
        Row: {
          created_at: string
          description: string | null
          id: number
          is_deleted: boolean | null
          name: string
          status: string
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: number
          is_deleted?: boolean | null
          name: string
          status?: string
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: number
          is_deleted?: boolean | null
          name?: string
          status?: string
        }
        Relationships: []
      }
      n_ai_usage: {
        Row: {
          client_id: number
          id: number
          prompt_text: string
          timestamp: string
          tokens_used: number
        }
        Insert: {
          client_id: number
          id?: number
          prompt_text: string
          timestamp?: string
          tokens_used: number
        }
        Update: {
          client_id?: number
          id?: number
          prompt_text?: string
          timestamp?: string
          tokens_used?: number
        }
        Relationships: [
          {
            foreignKeyName: "fk_n_ai_usage_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_client"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_n_ai_usage_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["client_id"]
          },
        ]
      }
      n_chat_group: {
        Row: {
          category: number | null
          client_id: number
          created_at: string
          id: number
          is_active: boolean
          title: string
          updated_at: string
        }
        Insert: {
          category?: number | null
          client_id: number
          created_at?: string
          id?: number
          is_active?: boolean
          title: string
          updated_at?: string
        }
        Update: {
          category?: number | null
          client_id?: number
          created_at?: string
          id?: number
          is_active?: boolean
          title?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "n_chat_group_client_id_fkey"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_client"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "n_chat_group_client_id_fkey"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["client_id"]
          },
        ]
      }
      n_chat_message: {
        Row: {
          client_id: number
          content: string
          created_at: string
          group_id: number | null
          id: number
          role: string
        }
        Insert: {
          client_id: number
          content: string
          created_at?: string
          group_id?: number | null
          id?: number
          role: string
        }
        Update: {
          client_id?: number
          content?: string
          created_at?: string
          group_id?: number | null
          id?: number
          role?: string
        }
        Relationships: [
          {
            foreignKeyName: "fk_n_chat_message_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_client"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_n_chat_message_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["client_id"]
          },
          {
            foreignKeyName: "n_chat_message_group_id_fkey"
            columns: ["group_id"]
            isOneToOne: false
            referencedRelation: "n_chat_group"
            referencedColumns: ["id"]
          },
        ]
      }
      n_client: {
        Row: {
          created_at: string
          email: string
          id: number
          name: string
          phone: string | null
          updated_at: string
          user_id: string
        }
        Insert: {
          created_at?: string
          email: string
          id?: number
          name: string
          phone?: string | null
          updated_at?: string
          user_id: string
        }
        Update: {
          created_at?: string
          email?: string
          id?: number
          name?: string
          phone?: string | null
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
      n_cobranca_clientes: {
        Row: {
          created_at: string
          dia_mes_cobranca: number
          email: string | null
          email_copia: string | null
          horario_cobranca: string
          id: number
          link_pagamento: string | null
          mensagem_customizada: string | null
          nome_cliente: string
          pix: string | null
          updated_at: string
          user_id: string
          valor_mensal: number
          whatsapp: string | null
        }
        Insert: {
          created_at?: string
          dia_mes_cobranca: number
          email?: string | null
          email_copia?: string | null
          horario_cobranca: string
          id?: number
          link_pagamento?: string | null
          mensagem_customizada?: string | null
          nome_cliente: string
          pix?: string | null
          updated_at?: string
          user_id: string
          valor_mensal: number
          whatsapp?: string | null
        }
        Update: {
          created_at?: string
          dia_mes_cobranca?: number
          email?: string | null
          email_copia?: string | null
          horario_cobranca?: string
          id?: number
          link_pagamento?: string | null
          mensagem_customizada?: string | null
          nome_cliente?: string
          pix?: string | null
          updated_at?: string
          user_id?: string
          valor_mensal?: number
          whatsapp?: string | null
        }
        Relationships: []
      }
      n_nemeia_clients: {
        Row: {
          created_at: string
          data_criacao: string
          email: string
          id: number
          nome: string
          pacote_atual: string | null
          saldo_adicional: number | null
          updated_at: string
          user_id: string | null
          uso_tokens: number | null
        }
        Insert: {
          created_at?: string
          data_criacao?: string
          email: string
          id?: number
          nome: string
          pacote_atual?: string | null
          saldo_adicional?: number | null
          updated_at?: string
          user_id?: string | null
          uso_tokens?: number | null
        }
        Update: {
          created_at?: string
          data_criacao?: string
          email?: string
          id?: number
          nome?: string
          pacote_atual?: string | null
          saldo_adicional?: number | null
          updated_at?: string
          user_id?: string | null
          uso_tokens?: number | null
        }
        Relationships: []
      }
      n_notification_clients: {
        Row: {
          client_id: number | null
          created_at: string
          data: string
          descricao: string
          id: number
          lida: boolean | null
          titulo: string
          updated_at: string
        }
        Insert: {
          client_id?: number | null
          created_at?: string
          data?: string
          descricao: string
          id?: number
          lida?: boolean | null
          titulo: string
          updated_at?: string
        }
        Update: {
          client_id?: number | null
          created_at?: string
          data?: string
          descricao?: string
          id?: number
          lida?: boolean | null
          titulo?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "n_notification_clients_client_id_fkey"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_client"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "n_notification_clients_client_id_fkey"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["client_id"]
          },
        ]
      }
      n_plan: {
        Row: {
          created_at: string
          description: string | null
          email_limit: number | null
          id: number
          is_active: boolean
          monthly_price: number
          title: string
          tokens_limit: number
          updated_at: string
          whatsapp_limit: number | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          email_limit?: number | null
          id?: number
          is_active?: boolean
          monthly_price: number
          title: string
          tokens_limit: number
          updated_at?: string
          whatsapp_limit?: number | null
        }
        Update: {
          created_at?: string
          description?: string | null
          email_limit?: number | null
          id?: number
          is_active?: boolean
          monthly_price?: number
          title?: string
          tokens_limit?: number
          updated_at?: string
          whatsapp_limit?: number | null
        }
        Relationships: []
      }
      n_reminders: {
        Row: {
          created_at: string
          descricao: string
          dia_mes: number
          email: string | null
          horario: string
          id: number
          mensagem: string | null
          updated_at: string
          user_id: string
          whatsapp: string | null
        }
        Insert: {
          created_at?: string
          descricao: string
          dia_mes: number
          email?: string | null
          horario?: string
          id?: number
          mensagem?: string | null
          updated_at?: string
          user_id: string
          whatsapp?: string | null
        }
        Update: {
          created_at?: string
          descricao?: string
          dia_mes?: number
          email?: string | null
          horario?: string
          id?: number
          mensagem?: string | null
          updated_at?: string
          user_id?: string
          whatsapp?: string | null
        }
        Relationships: []
      }
      n_subscription: {
        Row: {
          client_id: number
          created_at: string
          end_date: string | null
          id: number
          is_active: boolean
          plan_id: number
          start_date: string
          updated_at: string
        }
        Insert: {
          client_id: number
          created_at?: string
          end_date?: string | null
          id?: number
          is_active?: boolean
          plan_id: number
          start_date?: string
          updated_at?: string
        }
        Update: {
          client_id?: number
          created_at?: string
          end_date?: string | null
          id?: number
          is_active?: boolean
          plan_id?: number
          start_date?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "fk_n_subscription_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_client"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_n_subscription_client"
            columns: ["client_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["client_id"]
          },
          {
            foreignKeyName: "fk_n_subscription_plan"
            columns: ["plan_id"]
            isOneToOne: false
            referencedRelation: "n_monthly_usage"
            referencedColumns: ["plan_id"]
          },
          {
            foreignKeyName: "fk_n_subscription_plan"
            columns: ["plan_id"]
            isOneToOne: false
            referencedRelation: "n_plan"
            referencedColumns: ["id"]
          },
        ]
      }
      n8n_chat_histories: {
        Row: {
          created_at: string
          id: number
        }
        Insert: {
          created_at?: string
          id?: number
        }
        Update: {
          created_at?: string
          id?: number
        }
        Relationships: []
      }
      patient_medical_plans: {
        Row: {
          card_number: string | null
          created_at: string
          description: string | null
          expiration_date: string | null
          holder_name: string | null
          id: number
          medical_plan_id: number
          patient_id: number
        }
        Insert: {
          card_number?: string | null
          created_at?: string
          description?: string | null
          expiration_date?: string | null
          holder_name?: string | null
          id?: number
          medical_plan_id: number
          patient_id: number
        }
        Update: {
          card_number?: string | null
          created_at?: string
          description?: string | null
          expiration_date?: string | null
          holder_name?: string | null
          id?: number
          medical_plan_id?: number
          patient_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "patient_medical_plans_medical_plan_id_fkey"
            columns: ["medical_plan_id"]
            isOneToOne: false
            referencedRelation: "medical_plans"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "patient_medical_plans_patient_id_fkey"
            columns: ["patient_id"]
            isOneToOne: false
            referencedRelation: "patients"
            referencedColumns: ["id"]
          },
        ]
      }
      patients: {
        Row: {
          address_bairro: string | null
          address_cep: string | null
          address_cidade: string | null
          address_complemento: string | null
          address_rua: string | null
          address_uf: string | null
          birth_date: string | null
          cellphone: string | null
          cpf: string | null
          created_at: string
          email: string
          id: number
          identification_color: string | null
          image_url: string | null
          is_deleted: boolean | null
          last_appointment: string | null
          medical_plan_id: number | null
          name: string
          next_appointment: string | null
          sex: string | null
        }
        Insert: {
          address_bairro?: string | null
          address_cep?: string | null
          address_cidade?: string | null
          address_complemento?: string | null
          address_rua?: string | null
          address_uf?: string | null
          birth_date?: string | null
          cellphone?: string | null
          cpf?: string | null
          created_at?: string
          email: string
          id?: number
          identification_color?: string | null
          image_url?: string | null
          is_deleted?: boolean | null
          last_appointment?: string | null
          medical_plan_id?: number | null
          name: string
          next_appointment?: string | null
          sex?: string | null
        }
        Update: {
          address_bairro?: string | null
          address_cep?: string | null
          address_cidade?: string | null
          address_complemento?: string | null
          address_rua?: string | null
          address_uf?: string | null
          birth_date?: string | null
          cellphone?: string | null
          cpf?: string | null
          created_at?: string
          email?: string
          id?: number
          identification_color?: string | null
          image_url?: string | null
          is_deleted?: boolean | null
          last_appointment?: string | null
          medical_plan_id?: number | null
          name?: string
          next_appointment?: string | null
          sex?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "patients_medical_plan_id_fkey"
            columns: ["medical_plan_id"]
            isOneToOne: false
            referencedRelation: "medical_plans"
            referencedColumns: ["id"]
          },
        ]
      }
      procedure_prices: {
        Row: {
          created_at: string
          id: number
          is_deleted: boolean | null
          medical_plan_id: number
          price: number
          procedure_id: number
        }
        Insert: {
          created_at?: string
          id?: number
          is_deleted?: boolean | null
          medical_plan_id: number
          price?: number
          procedure_id: number
        }
        Update: {
          created_at?: string
          id?: number
          is_deleted?: boolean | null
          medical_plan_id?: number
          price?: number
          procedure_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "procedure_prices_medical_plan_id_fkey"
            columns: ["medical_plan_id"]
            isOneToOne: false
            referencedRelation: "medical_plans"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "procedure_prices_procedure_id_fkey"
            columns: ["procedure_id"]
            isOneToOne: false
            referencedRelation: "a_procedures"
            referencedColumns: ["id"]
          },
        ]
      }
      professional_procedures: {
        Row: {
          created_at: string
          id: number
          procedure_id: number
          professional_id: number
        }
        Insert: {
          created_at?: string
          id?: number
          procedure_id: number
          professional_id: number
        }
        Update: {
          created_at?: string
          id?: number
          procedure_id?: number
          professional_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "professional_procedures_procedure_id_fkey"
            columns: ["procedure_id"]
            isOneToOne: false
            referencedRelation: "a_procedures"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "professional_procedures_professional_id_fkey"
            columns: ["professional_id"]
            isOneToOne: false
            referencedRelation: "professionals"
            referencedColumns: ["id"]
          },
        ]
      }
      professionals: {
        Row: {
          address_bairro: string | null
          address_cep: string | null
          address_cidade: string | null
          address_complemento: string | null
          address_rua: string | null
          address_uf: string | null
          birth_date: string | null
          cellphone: string | null
          cpf: string | null
          created_at: string
          crm: string | null
          email: string
          id: number
          identification_color: string | null
          image_url: string | null
          is_deleted: boolean | null
          name: string
          sex: string | null
          specialty: string | null
        }
        Insert: {
          address_bairro?: string | null
          address_cep?: string | null
          address_cidade?: string | null
          address_complemento?: string | null
          address_rua?: string | null
          address_uf?: string | null
          birth_date?: string | null
          cellphone?: string | null
          cpf?: string | null
          created_at?: string
          crm?: string | null
          email: string
          id?: number
          identification_color?: string | null
          image_url?: string | null
          is_deleted?: boolean | null
          name: string
          sex?: string | null
          specialty?: string | null
        }
        Update: {
          address_bairro?: string | null
          address_cep?: string | null
          address_cidade?: string | null
          address_complemento?: string | null
          address_rua?: string | null
          address_uf?: string | null
          birth_date?: string | null
          cellphone?: string | null
          cpf?: string | null
          created_at?: string
          crm?: string | null
          email?: string
          id?: number
          identification_color?: string | null
          image_url?: string | null
          is_deleted?: boolean | null
          name?: string
          sex?: string | null
          specialty?: string | null
        }
        Relationships: []
      }
      profiles: {
        Row: {
          avatar_url: string | null
          created_at: string
          establishment: string | null
          id: number
          is_deleted: boolean | null
          language: Database["public"]["Enums"]["app_language"]
          name: string | null
          role: string
          theme: string
          updated_at: string
          user_id: string
        }
        Insert: {
          avatar_url?: string | null
          created_at?: string
          establishment?: string | null
          id?: number
          is_deleted?: boolean | null
          language?: Database["public"]["Enums"]["app_language"]
          name?: string | null
          role?: string
          theme?: string
          updated_at?: string
          user_id: string
        }
        Update: {
          avatar_url?: string | null
          created_at?: string
          establishment?: string | null
          id?: number
          is_deleted?: boolean | null
          language?: Database["public"]["Enums"]["app_language"]
          name?: string | null
          role?: string
          theme?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      n_monthly_usage: {
        Row: {
          client_id: number | null
          client_name: string | null
          month: string | null
          plan_id: number | null
          plan_title: string | null
          tokens_limit: number | null
          total_tokens_used: number | null
        }
        Relationships: []
      }
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      app_language: "en" | "pt"
      app_role: "level1" | "level2" | "level3" | "admin"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DefaultSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      app_language: ["en", "pt"],
      app_role: ["level1", "level2", "level3", "admin"],
    },
  },
} as const
