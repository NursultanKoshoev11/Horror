// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "SpawnSubsystem.generated.h"

/**
 * 
 */
UCLASS()
class POLYGONHORRORMANSION_API USpawnSubsystem : public UGameInstanceSubsystem
{
	GENERATED_BODY()

public:

	UFUNCTION(BlueprintCallable)
	void SetActor(AActor *Actor);

	UFUNCTION(BlueprintCallable)
	AActor * GetActor(int32 ID) const;

	UFUNCTION(BlueprintCallable)
	int32 GetCount() const;

	
private:

	UPROPERTY()
	TArray<AActor*> SpawnedActors;
};
