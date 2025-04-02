// Fill out your copyright notice in the Description page of Project Settings.


#include "SpawnSubSystem/SpawnSubsystem.h"

void USpawnSubsystem::SetActor(AActor* Actor)
{
	SpawnedActors.Add(Actor);
}

AActor* USpawnSubsystem::GetActor(int32 ID) const
{
	if(SpawnedActors.IsValidIndex(ID))
		return SpawnedActors[ID];

	return nullptr;
}

int32 USpawnSubsystem::GetCount() const
{
	return SpawnedActors.Num();
}
