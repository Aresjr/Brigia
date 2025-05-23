
import { useEffect, useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { MessageCircle, Send } from "lucide-react";

interface ChatDialogProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
}

export const ChatDialog = ({ isOpen, onOpenChange }: ChatDialogProps) => {
  const [message, setMessage] = useState("");
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (isOpen && inputRef.current) {
      inputRef.current.focus();
    }
  }, [isOpen]);

  if (!isOpen) {
    return (
      <Button
        onClick={() => onOpenChange(true)}
        className="fixed right-4 bottom-4 rounded-full p-3 shadow-lg"
      >
        <MessageCircle className="h-6 w-6" />
      </Button>
    );
  }

  return (
    <div className="fixed right-4 bottom-4 flex flex-col items-end gap-2">
      <div className="flex items-center gap-2 bg-background border rounded-lg p-2 shadow-lg w-[300px]">
        <Input
          ref={inputRef}
          placeholder="Type your message..."
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          className="flex-1"
        />
        <Button size="icon" className="shrink-0">
          <Send className="h-4 w-4" />
        </Button>
      </div>
      <Button
        onClick={() => onOpenChange(false)}
        className="rounded-full p-3 shadow-lg"
      >
        <MessageCircle className="h-6 w-6" />
      </Button>
    </div>
  );
};
