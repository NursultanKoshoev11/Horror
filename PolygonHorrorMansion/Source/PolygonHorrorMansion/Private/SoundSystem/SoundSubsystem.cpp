// Fill out your copyright notice in the Description page of Project Settings.


#include "SoundSystem/SoundSubsystem.h"

void USoundSubsystem::PlaySound(USoundBase * Sound,FVector Location, float Volume)
{
	OnPlaySoundDelegate.Broadcast(Sound,Location,Volume);
}
