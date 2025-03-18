// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "SoundSubsystem.generated.h"

class AHorror_GameState;
DECLARE_DYNAMIC_MULTICAST_DELEGATE(FSoundHighDelegate);
DECLARE_DYNAMIC_MULTICAST_DELEGATE_ThreeParams(FPlaySoundDelegate,USoundBase*,Sound,FVector,Location,float, Value);

UCLASS()
class POLYGONHORRORMANSION_API USoundSubsystem : public UGameInstanceSubsystem
{
	GENERATED_BODY()

public:

	FSoundHighDelegate SoundHighDelegate;

	UPROPERTY(BlueprintAssignable)
	FPlaySoundDelegate OnPlaySoundDelegate;

	UFUNCTION(BlueprintCallable)
	void PlaySound(USoundBase * Sound,FVector Location, float Volume);

};
