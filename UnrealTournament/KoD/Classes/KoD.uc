// ====================================================================
//  KoD.
//  Copyright (c) 2001-2014 by Stefan Hüsges
// ====================================================================

class KoD extends Mutator;

var bool Initialized;

function ModifyPlayer(Pawn Other)
{
    if (Other.Health < 120) {
        Other.Health = 120;
    }

    if (NextMutator != None) {
        NextMutator.ModifyPlayer(Other);
    }
}

function PostBeginPlay()
{
    if (Initialized) {
        return;
    }

    Initialized = True;

    Level.Game.RegisterDamageMutator(Self);

    SetTimer(2.0, true);
}

simulated function Timer()
{
    local Pawn P;
    foreach AllActors(class'Pawn', P) {
        P.Health--;
        if (P.Health < 1) {
            P.TakeDamage(1000, None, Vect(0, 0, 0), Vect(0, 0, 1), 'exploded');
        }
    }
}

function MutatorTakeDamage(out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation, out Vector Momentum, name DamageType)
{
    if (InstigatedBy.IsA('Bot') || InstigatedBy.IsA('PlayerPawn')) {
        if (Victim.IsA('Bot') || Victim.IsA('PlayerPawn')) {
            if (Victim.Health <= ActualDamage) {
                if (InstigatedBy.Health < 400) {
                    if (InstigatedBy.Health < 200)
                        InstigatedBy.Health += 20;
                    else if (InstigatedBy.Health < 210)
                        InstigatedBy.Health += 19;
                    else if (InstigatedBy.Health < 220)
                        InstigatedBy.Health += 18;
                    else if (InstigatedBy.Health < 230)
                        InstigatedBy.Health += 17;
                    else if (InstigatedBy.Health < 240)
                        InstigatedBy.Health += 16;
                    else if (InstigatedBy.Health < 250)
                        InstigatedBy.Health += 15;
                    else if (InstigatedBy.Health < 260)
                        InstigatedBy.Health += 14;
                    else if (InstigatedBy.Health < 270)
                        InstigatedBy.Health += 13;
                    else if (InstigatedBy.Health < 280)
                        InstigatedBy.Health += 12;
                    else if (InstigatedBy.Health < 290)
                        InstigatedBy.Health += 11;
                    else if (InstigatedBy.Health < 300)
                        InstigatedBy.Health += 10;
                    else if (InstigatedBy.Health < 310)
                        InstigatedBy.Health += 9;
                    else if (InstigatedBy.Health < 320)
                        InstigatedBy.Health += 8;
                    else if (InstigatedBy.Health < 330)
                        InstigatedBy.Health += 7;
                    else if (InstigatedBy.Health < 340)
                        InstigatedBy.Health += 6;
                    else if (InstigatedBy.Health < 350)
                        InstigatedBy.Health += 5;
                    else if (InstigatedBy.Health < 360)
                        InstigatedBy.Health += 4;
                    else if (InstigatedBy.Health < 370)
                        InstigatedBy.Health += 3;
                    else if (InstigatedBy.Health < 380)
                        InstigatedBy.Health += 2;
                    else if (InstigatedBy.Health < 390)
                        InstigatedBy.Health += 1;
                }
                else {
                    InstigatedBy.Health = 400;
                }
            }
        }
    }
    if (NextDamageMutator != None)
        NextDamageMutator.MutatorTakeDamage(ActualDamage, Victim, InstigatedBy, HitLocation, Momentum, DamageType);
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    if (Other.IsA('TournamentHealth')) {
        return False;
    }
    return True;
}

defaultproperties
{
}
