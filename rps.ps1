$UserWins = 0;
$ComputerWins = 0;
$Ties = 0;
$winner = $false;
$WhoWon = "";
$ChoiceList = 'R','P','S';

Write-Output "Welcome to Rock Paper Scissors, Get 5 wins to win the Game!";

while (-not $winner) {
	while ($UserWins -lt 5 -and $ComputerWins -lt 5) {
	
		$UserChoice = Read-Host -Prompt "Choose Rock, Paper or Scissors (Type r, p, or s): ";
		
		while ($UserChoice -ne 'r' -and $UserChoice -ne 'p' -and $UserChoice -ne 's'){
			$UserChoice = Read-Host -Prompt "Invalid Choice... Choose Rock, Paper or Scissors (Type r, p, or s): ";
		}
		
		$UserChoice = $UserChoice.ToUpper();
		$ComputerChoice = Get-Random -InputObject $ChoiceList;
		Write-Output "User Chose '$UserChoice' and Computer Chose '$ComputerChoice'";
		
		if($UserChoice -eq $ComputerChoice) {
			Write-Output "Tie, try again"
			$Ties++;
		} else {
			if ($UserChoice -eq 'R' -and $ComputerChoice -eq 'S') {
				Write-Output "Rock beats Scissors: User Wins";
				$UserWins++
			} elseif ($UserChoice -eq 'P' -and $ComputerChoice -eq 'R') {
				Write-Output "Paper beats Rock: User Wins";
				$UserWins++
			} elseif ($UserChoice -eq 'S' -and $ComputerChoice -eq 'P') {
				Write-Output "Scissors Beats Paper: User Wins";
				$UserWins++				
			}
			
			if ($ComputerChoice -eq 'R' -and $UserChoice -eq 'S') {
				Write-Output "Rock beats Scissors: Computer Wins";
				$ComputerWins++
			} elseif ($ComputerChoice -eq 'P' -and $UserChoice -eq 'R') {
				Write-Output "Paper beats Scissors: Computer Wins";
				$ComputerWins++
			} elseif ($ComputerChoice -eq 'S' -and $UserChoice -eq 'P') {
				Write-Output "Scissors beats Paper: Computer Wins";	
				$ComputerWins++				
			}
		}
	}
	if ($UserWins -ge 5) {
		$WhoWon = "User"
	} else {
		$WhoWon = "Computer"
	}
	$winner = $true;
}

Write-Host "Congratulations, $WhoWon, You Win!"
Write-Host "User Wins: $UserWins";
Write-Host "Computer Wins: $ComputerWins";
Write-Host "Ties: $Ties"
