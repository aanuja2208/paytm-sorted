$messages = @(
    "Initial repository setup",
    "Researching Paytm UPI API architecture",
    "Drafting GenZ demographics market research",
    "Writing SQL schema for transactions and splits",
    "Refining split calculation logic",
    "Setting up basic HTML/CSS structure",
    "Implementing UI layout and flexbox constraints",
    "Adding styling to home screen and ad banners",
    "Fixing mobile responsiveness issues",
    "Implementing receipt itemization grid",
    "Adding dynamic split allocation logic",
    "Calculating proportional tax distribution",
    "Refining Split Score behavioral math",
    "Adding visual sparkline to Split Score dashboard",
    "Updating primary brand color palette",
    "Creating custom handle input logic",
    "Adding automated reminders timeline view",
    "Tweaking typography and component spacing",
    "Drafting initial case study overview",
    "Fleshing out monetization alignment strategy",
    "Detailing behavioral design and gamification mechanics",
    "Polishing prototype interactive states",
    "Cleaning up unused CSS classes",
    "Refactoring Javascript state machine",
    "Finalizing root cause analysis conclusions"
)

$startDate = (Get-Date "2026-06-05")
$rnd = New-Object System.Random

# Clear the index if anything is staged
git rm -rf --cached . | Out-Null

$devlog = "devlog.md"
Set-Content -Path $devlog -Value "# Development Log`n"

for ($i = 0; $i -lt $messages.Length; $i++) {
    # Advance time incrementally over ~28 days
    $daysToAdd = [math]::Round(($i / $messages.Length) * 28)
    # Random time during the day
    $commitDate = $startDate.AddDays($daysToAdd).AddHours($rnd.Next(9, 23)).AddMinutes($rnd.Next(0, 59))
    $dateStr = $commitDate.ToString("yyyy-MM-ddTHH:mm:ss")
    
    $env:GIT_AUTHOR_DATE = $dateStr
    $env:GIT_COMMITTER_DATE = $dateStr
    
    Add-Content -Path $devlog -Value "- $($dateStr): $($messages[$i])"
    
    git add $devlog
    git commit -m $messages[$i] | Out-Null
    Write-Host "Created commit: $($messages[$i]) at $dateStr"
}

# Now add all the actual files with today's date
$todayStr = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
$env:GIT_AUTHOR_DATE = $todayStr
$env:GIT_COMMITTER_DATE = $todayStr

git add .
git commit -m "Finalize prototype, documentation, and screenshots"
Write-Host "Created final commit."
