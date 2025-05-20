# Freelancer Project with Time Tracking

This repository is set up with time tracking for our freelance development team using GitHub Codespaces and WakaTime.

## Getting Started

### 1. Open in Codespaces

Click the "Code" button on the repository page, then select the "Codespaces" tab and click "Create codespace on main".

### 2. Configure WakaTime

When the Codespace opens, you'll need to configure your WakaTime API key:

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) to open the Command Palette
2. Type "WakaTime: API Key" and press Enter
3. Enter your WakaTime API key
   - If you don't have one, sign up at [wakatime.com](https://wakatime.com) and get your key from your account settings

### 3. Verify Time Tracking

To verify that time tracking is working:

1. Make some edits to any file
2. Wait a few minutes
3. Check your WakaTime dashboard at [wakatime.com](https://wakatime.com)

## For Team Managers

### Viewing Time Reports

1. Time reports are automatically generated weekly via GitHub Actions
2. Download the latest report from the Actions tab
3. Open the `public/time-report-viewer.html` file in your browser
4. Upload the JSON report file to visualize the data

### Manual Report Generation

To generate a time report manually:

1. Go to the Actions tab
2. Select the "Weekly Time Reports" workflow
3. Click "Run workflow"
4. Download the artifact once the workflow completes

## Need Help?

Contact the team manager if you have any issues with time tracking setup.
