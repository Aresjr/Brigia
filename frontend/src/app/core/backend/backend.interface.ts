
export interface ErrorResponse {
  status: number;
  message?: string;
  messages?: string[];
  path: string;
  timestamp?: string;
}
