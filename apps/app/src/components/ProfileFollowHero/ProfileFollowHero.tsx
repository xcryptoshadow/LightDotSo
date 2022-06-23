import type { FC } from "react";

import { Error } from "@lightdotso/app/components/Error";
import { LoadingText } from "@lightdotso/app/components/LoadingText";
import { PlaceholderAvatar } from "@lightdotso/app/components/PlaceholderAvatar";
import { PlaceholderProfileLoading } from "@lightdotso/app/components/PlaceholderProfileLoading";
import { ProfileFollowHeroButton } from "@lightdotso/app/components/ProfileFollowHeroButton";
import { ProfileFollowHeroTabs } from "@lightdotso/app/components/ProfileFollowHeroTabs";
import type { ProfileFollowHeroTabsProps } from "@lightdotso/app/components/ProfileFollowHeroTabs";
import { useEns } from "@lightdotso/app/hooks/useEns";
import { useProfileAddress } from "@lightdotso/app/hooks/useProfileAddress";
import { splitAddress } from "@lightdotso/app/utils/splitAddress";

export type ProfileFollowHeroProps = {
  address?: string;
} & ProfileFollowHeroTabsProps;

export const ProfileFollowHero: FC<ProfileFollowHeroProps> = ({
  follow,
  address,
}) => {
  const { ens } = useEns(address);
  const { profileAddress, isLoading: isProfileAddressLoading } =
    useProfileAddress(address);

  if (!profileAddress && !isProfileAddressLoading) {
    return <Error statusCode={404} />;
  }

  return (
    <div className="bg-bg-lighter">
      <div className="flex flex-row items-center p-4 mx-auto max-w-5xl">
        <div className="flex items-center">
          <ProfileFollowHeroButton address={profileAddress} />
          {!profileAddress ? (
            <PlaceholderProfileLoading className="ml-4 w-12 h-12" />
          ) : (
            <div className="pl-4">
              <PlaceholderAvatar
                address={profileAddress}
                className="w-12 h-12"
              />
            </div>
          )}
          <h2 className="flex justify-start pl-4 text-xl font-bold text-contrast-higher">
            {!profileAddress ? (
              <LoadingText className="w-24 h-8" />
            ) : (
              ens ?? splitAddress(profileAddress)
            )}
          </h2>
        </div>
      </div>
      <ProfileFollowHeroTabs address={profileAddress} follow={follow} />
    </div>
  );
};
