
%defense stocks

% Define the tickers and their corresponding company names
tickers = {'LMT', 'NOC', 'GD', 'AVAV'};
companyNames = {'Lockheed Martin', 'Northrop Grumman', 'General Dynamics', 'AeroVironment'};

% Define the folder containing the Excel files (update this path)
folderPath = 'defenseStocks'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end


%sector stocks 



% Define the tickers and their corresponding company names
tickers = {'XLB', 'XLE', 'XLF', 'XLI', 'XLK','XLP','XLRE','XLU','XLV','XLY'};
companyNames = {'Materials Sector', 'Energy Sector', 'Finance Sector', 'Industrials Sector', 'Tech Sector','Consumer Staples','Real Estate Sector','Utilities Sector','Healthcare Sector','Consumer Discretionary'};

% Define the folder containing the Excel files (update this path)
folderPath = 'etfSector'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end


% General ETFS

% Define the tickers and their corresponding company names
tickers = {'EEM', 'IEFA', 'IWM', 'QQQ', 'RING','SCHA','SMH','SPY','VIG','VOOG'};
companyNames = {'iShares MSCI Emerging Markets', 'iShares Core MSCI EAFE ETF', 'iShares Russell 2000 ETF', 'Invesco QQQ Trust', 'iShares MSCI Global Gold Miners','Schwab US Small-Cap ETF','VanEck Semiconductor ETF','SPDR S&P 500 ETF','Vanguard Dividend Appreciation','Vanguard S&P 500 Growth ETF'};

% Define the folder containing the Excel files (update this path)
folderPath = 'general'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end


% global inices ETFS

% Define the tickers and their corresponding company names
tickers = {'EWJ', 'FXI', 'IGF', 'VGK', 'VWO'};
companyNames = {'iShares MSCI Japan Shares', 'iShares China Large-cap ETF', 'iShares Global Infrastructure ETF', 'Vanguard FTSE Europe ETF','Vanguard Emerging Markets ETF'};

% Define the folder containing the Excel files (update this path)
folderPath = 'global'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end



% tech stocks 

% Define the tickers and their corresponding company names
tickers = {'AAPL', 'AMZN', 'META', 'MSFT', 'NVDA'};
companyNames = {'Apple Inc.', 'Amazon.com Inc.', 'Meta Platforms Inc.', 'Microsoft Corp.', 'Nividia Corp.'};

% Define the folder containing the Excel files (update this path)
folderPath = 'techStocks'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end


% Thematic ETFS

% Define the tickers and their corresponding company names
tickers = {'ARKG', 'BOTZ', 'HACK', 'ICLN', 'UFO'};
companyNames = {'ARK Genomic Revolution ETF', 'Global X Robotics & AI ETF', 'ETFMG Prime Cybersecurity ETF', 'iShares Global Clean Energy ETF', 'Procure Space ETF'};

% Define the folder containing the Excel files (update this path)
folderPath = 'thematic'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end


% Commodities ETFS


% Define the tickers and their corresponding company names
tickers = {'DBA', 'GLD', 'SLV', 'TIP', 'USO'};
companyNames = {'Invesco DB Agriculture Fund', 'SPDR Gold Shares', 'iShares Silver Trust', 'iShares TIPS Bond ETF', 'United States Oil Fund'};

% Define the folder containing the Excel files (update this path)
folderPath = 'commodities'; % Update this path

% Loop through each ticker symbol
for i = 1:length(tickers)
    % Construct the file name based on the ticker symbol
    fileName = fullfile(folderPath, [tickers{i}, '.xlsx']);

    % Check if the file exists
    if isfile(fileName)
        % Read the data from the Excel file
        data = readtable(fileName);

        % Check if 'Date' and 'Close' columns exist
        if ismember('Date', data.Properties.VariableNames) && ismember('Close', data.Properties.VariableNames)
            % Create a new figure for each plot
            figure;

            % Plot the data
            plot(data.Date, data.Close);
            xlabel('Date'); % Label for x-axis
            ylabel('Price'); % Label for y-axis

            % Set the title to include the company name
            title(['Price vs Date for ', companyNames{i}]);
            grid on; % Add grid for better readability
        else
            warning(['Columns "Date" or "Close" not found in ', tickers{i}, '.xlsx']);
        end
    else
        warning(['File not found: ', fileName]);
    end
end






