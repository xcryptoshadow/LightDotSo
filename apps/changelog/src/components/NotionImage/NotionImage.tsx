import clsx from "clsx";
import Image from "next/image";
import type { FC, ImgHTMLAttributes } from "react";
import { useState } from "react";

export const NotionImage: FC<ImgHTMLAttributes<HTMLImageElement>> = ({
  src,
  alt,
}) => {
  const [isLoading, setLoading] = useState(true);

  return (
    <div className="aspect-w-16 aspect-h-9">
      <Image
        unoptimized
        layout="fill"
        objectFit="cover"
        className={clsx(
          "flex w-full h-full rounded-md grayscale duration-700 ease-in-out",
          isLoading
            ? "blur-2xl grayscale scale-110"
            : "blur-0 grayscale-0 scale-100",
        )}
        src={src}
        alt={alt}
        onLoadingComplete={() => {
          return setLoading(false);
        }}
      />
    </div>
  );
};
