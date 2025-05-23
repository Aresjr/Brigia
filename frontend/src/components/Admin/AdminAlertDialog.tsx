
import React, { useState, useEffect } from 'react';
import { supabase } from "@/integrations/supabase/client";

type AdminAlertDialogProps = {
  userId: string;
};

export const AdminAlertDialog = ({ userId }: AdminAlertDialogProps) => {
  // Component exists but doesn't display any dialog
  return null;
};
