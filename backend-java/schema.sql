-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.a_appointments (
  id integer NOT NULL DEFAULT nextval('a_appointment_id_seq'::regclass),
  patient_id integer NOT NULL,
  professional_id integer NOT NULL,
  start_date timestamp with time zone NOT NULL,
  end_date timestamp with time zone NOT NULL,
  description text,
  medical_plan_id integer,
  is_paid boolean DEFAULT false,
  cost numeric,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  is_deleted boolean DEFAULT false,
  procedure_id integer,
  CONSTRAINT a_appointments_pkey PRIMARY KEY (id),
  CONSTRAINT a_appointment_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.a_patients(id),
  CONSTRAINT fk_appointment_procedure FOREIGN KEY (procedure_id) REFERENCES public.a_procedures(id),
  CONSTRAINT a_appointment_professional_id_fkey FOREIGN KEY (professional_id) REFERENCES public.a_professionals(id),
  CONSTRAINT a_appointment_medical_plan_id_fkey FOREIGN KEY (medical_plan_id) REFERENCES public.a_medical_plans(id)
);
CREATE TABLE public.a_medical_plans (
  name text NOT NULL,
  description text,
  created_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  id integer NOT NULL DEFAULT nextval('medical_plans_temp_id_seq'::regclass),
  is_deleted boolean DEFAULT false,
  CONSTRAINT a_medical_plans_pkey PRIMARY KEY (id)
);
CREATE TABLE public.a_patient_medical_plans (
  id integer NOT NULL DEFAULT nextval('patient_medical_plans_id_seq'::regclass),
  patient_id integer NOT NULL,
  medical_plan_id integer NOT NULL,
  description text,
  card_number character varying CHECK (card_number::text ~ '^[0-9]*$'::text),
  expiration_date date,
  holder_name text,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT a_patient_medical_plans_pkey PRIMARY KEY (id),
  CONSTRAINT patient_medical_plans_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.a_patients(id),
  CONSTRAINT patient_medical_plans_medical_plan_id_fkey FOREIGN KEY (medical_plan_id) REFERENCES public.a_medical_plans(id)
);
CREATE TABLE public.a_patients (
  name text NOT NULL,
  email character varying NOT NULL UNIQUE,
  created_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  cpf character varying UNIQUE,
  birth_date date,
  sex character varying CHECK ((sex::bpchar = ANY (ARRAY['M'::bpchar, 'F'::bpchar])) OR sex IS NULL),
  cellphone character varying UNIQUE,
  last_appointment timestamp with time zone,
  next_appointment timestamp with time zone,
  is_deleted boolean DEFAULT false,
  image_url character varying,
  identification_color character varying,
  address_cep character varying,
  address_rua character varying,
  address_complemento character varying,
  address_bairro character varying,
  address_cidade character varying,
  address_uf character varying,
  id integer NOT NULL DEFAULT nextval('patients_temp_id_seq'::regclass),
  medical_plan_id integer,
  CONSTRAINT a_patients_pkey PRIMARY KEY (id),
  CONSTRAINT patients_medical_plan_id_fkey FOREIGN KEY (medical_plan_id) REFERENCES public.a_medical_plans(id)
);
CREATE TABLE public.a_procedure_prices (
  id integer NOT NULL DEFAULT nextval('procedure_prices_id_seq'::regclass),
  procedure_id integer NOT NULL,
  medical_plan_id integer,
  price numeric NOT NULL DEFAULT 0,
  is_deleted boolean DEFAULT false,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT a_procedure_prices_pkey PRIMARY KEY (id),
  CONSTRAINT procedure_prices_procedure_id_fkey FOREIGN KEY (procedure_id) REFERENCES public.a_procedures(id),
  CONSTRAINT procedure_prices_medical_plan_id_fkey FOREIGN KEY (medical_plan_id) REFERENCES public.a_medical_plans(id)
);
CREATE TABLE public.a_procedures (
  id integer NOT NULL DEFAULT nextval('a_procedures_id_seq'::regclass),
  description text NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  is_deleted boolean DEFAULT false,
  CONSTRAINT a_procedures_pkey PRIMARY KEY (id)
);
CREATE TABLE public.a_professional_procedures (
  id integer NOT NULL DEFAULT nextval('professional_procedures_id_seq'::regclass),
  professional_id integer NOT NULL,
  procedure_id integer NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT a_professional_procedures_pkey PRIMARY KEY (id),
  CONSTRAINT professional_procedures_professional_id_fkey FOREIGN KEY (professional_id) REFERENCES public.a_professionals(id),
  CONSTRAINT professional_procedures_procedure_id_fkey FOREIGN KEY (procedure_id) REFERENCES public.a_procedures(id)
);
CREATE TABLE public.a_professionals (
  id integer NOT NULL DEFAULT nextval('professionals_id_seq'::regclass),
  name text NOT NULL,
  email text NOT NULL,
  birth_date date,
  cpf text,
  sex character,
  cellphone text,
  image_url text,
  identification_color text,
  crm text,
  specialty text,
  address_cep text,
  address_rua text,
  address_complemento text,
  address_bairro text,
  address_cidade text,
  address_uf text,
  created_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  is_deleted boolean DEFAULT false,
  CONSTRAINT a_professionals_pkey PRIMARY KEY (id)
);
CREATE TABLE public.a_profiles (
  id integer NOT NULL DEFAULT nextval('profiles_new_id_seq'::regclass),
  user_id uuid NOT NULL,
  name text,
  avatar_url text,
  establishment text,
  role text NOT NULL DEFAULT 'user'::text,
  theme text NOT NULL DEFAULT 'light'::text,
  language USER-DEFINED NOT NULL DEFAULT 'en'::app_language,
  created_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  is_deleted boolean DEFAULT false,
  CONSTRAINT a_profiles_pkey PRIMARY KEY (id),
  CONSTRAINT profiles_new_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id)
);