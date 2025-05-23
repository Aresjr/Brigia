
import { Upload } from "lucide-react";
import { useState } from "react";

interface ProfilePictureUploadProps {
  profilePicturePreview: string | null;
  onPictureChange: (file: File | null) => void;
}

export const ProfilePictureUpload = ({ 
  profilePicturePreview,
  onPictureChange
}: ProfilePictureUploadProps) => {
  const compressImage = async (file: File): Promise<File> => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = (event) => {
        const img = new Image();
        img.src = event.target?.result as string;
        img.onload = () => {
          const canvas = document.createElement('canvas');
          // For profile pictures, we'll use a reasonable size
          const MAX_WIDTH = 800;
          const MAX_HEIGHT = 800;
          
          let width = img.width;
          let height = img.height;
          
          // Calculate the new dimensions
          if (width > height) {
            if (width > MAX_WIDTH) {
              height = Math.round(height * (MAX_WIDTH / width));
              width = MAX_WIDTH;
            }
          } else {
            if (height > MAX_HEIGHT) {
              width = Math.round(width * (MAX_HEIGHT / height));
              height = MAX_HEIGHT;
            }
          }
          
          canvas.width = width;
          canvas.height = height;
          
          const ctx = canvas.getContext('2d');
          ctx?.drawImage(img, 0, 0, width, height);
          
          // Convert to blob with quality 0.7 (70%) to reduce file size
          canvas.toBlob(
            (blob) => {
              if (!blob) {
                reject(new Error('Canvas to Blob conversion failed'));
                return;
              }
              
              // Create a new file from the blob
              const compressedFile = new File([blob], file.name, {
                type: 'image/jpeg',
                lastModified: Date.now(),
              });
              
              resolve(compressedFile);
            },
            'image/jpeg',
            0.7
          );
        };
      };
      reader.onerror = (error) => reject(error);
    });
  };

  const handleProfilePictureChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      try {
        const compressedFile = await compressImage(file);
        onPictureChange(compressedFile);
      } catch (error) {
        console.error('Erro ao comprimir a imagem:', error);
        // If compression fails, use the original file as fallback
        onPictureChange(file);
      }
    }
  };

  return (
    <div>
      <label className="block text-sm font-medium mb-1">Foto</label>
      <div className="flex items-center gap-4">
        {profilePicturePreview && (
          <div className="relative w-24 h-24 rounded-full overflow-hidden border border-input">
            <img
              src={profilePicturePreview}
              alt="Profile preview"
              className="w-full h-full object-cover"
            />
          </div>
        )}
        <label className="cursor-pointer flex items-center justify-center px-4 py-2 border border-input rounded-md hover:bg-muted">
          <Upload className="mr-2 h-4 w-4" />
          Choose Image
          <input
            type="file"
            className="hidden"
            accept="image/*"
            onChange={handleProfilePictureChange}
          />
        </label>
      </div>
    </div>
  );
};
