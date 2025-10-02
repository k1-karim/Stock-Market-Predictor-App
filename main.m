
folders = {'defenseStocks', 'commodoties', 'etfSector', 'general', ...
           'global', 'techStocks', 'thematic'};

fprintf('Select a folder:\n');
fprintf('1: defenseStocks\n');
fprintf('2: commodoties\n');
fprintf('3: etfSector\n');
fprintf('4: general\n');
fprintf('5: global\n');
fprintf('6: techStocks\n');
fprintf('7: thematic\n');
folder_idx = input('Enter folder number: ');

switch folder_idx
    case 1
        selected_folder = 'defenseStocks';
    case 2
        selected_folder = 'commodoties';
    case 3
        selected_folder = 'etfSector';
    case 4
        selected_folder = 'general';
    case 5
        selected_folder = 'global';
    case 6
        selected_folder = 'techStocks';
    case 7
        selected_folder = 'thematic';
    otherwise
        error('Invalid folder number selected.');
end

% --- Load plot_data from selected folder ---
data_path = fullfile(selected_folder, 'plot_data.mat');
if exist(data_path, 'file')
    s = load(data_path);
    if isfield(s, 'plot_data')
        plot_data = s.plot_data;
    else
        error('plot_data variable not found in plot_data.mat.');
    end
else
    error('plot_data.mat not found in selected folder.');
end

% --- User selects prediction scenario ---
fprintf('\nSelect prediction type:\n');
fprintf('1: Historical Data Only (Blue)\n');
fprintf('2: Predict Next 5 Days (Red)\n');
fprintf('3: Predict Next 10 Days (Green)\n');
fprintf('4: Predict Next 30 Days (Yellow)\n');
pred_type = input('Enter prediction type number: ');
if ~ismember(pred_type, 1:4)
    error('Invalid prediction type number. Please select 1, 2, 3, or 4.');
end

% --- Field to use for prediction ---
field_name = input('Enter field/column name to use for prediction (e.g., ''Close''): ', 's');
if isstruct(plot_data)
    valid_fields = fieldnames(plot_data);
elseif istable(plot_data)
    valid_fields = plot_data.Properties.VariableNames;
else
    error('plot_data must be a struct or table.');
end
if ~ismember(field_name, valid_fields)
    error('Field name "%s" not found in plot_data.', field_name);
end

% --- Plot according to scenario ---
switch pred_type
    case 1 % Historical only
        data = plot_data.(field_name);
        n = length(data);
        figure;
        plot(1:n, data, 'b-o', 'DisplayName', 'Historical Data');
        xlabel('Day');
        ylabel(field_name);
        legend;
        title(['Historical Data: ', field_name]);
    case 2 % Predict 5 days
        predictions = plotPredict5Days(plot_data, field_name);
    case 3 % Predict 10 days
        predictions = plotPredict10Days(plot_data, field_name, 10);
        data = plot_data.(field_name);
        n = length(data);
        X = (1:n)';
        X_future = (n+1:n+10)';
        figure;
        plot(X, data, 'b-o', 'DisplayName', 'Historical Data');
        hold on;
        plot(X_future, predictions, 'g--*', 'DisplayName', 'Predicted Next 10 Days');
        xlabel('Day');
        ylabel(field_name);
        legend;
        title(['Prediction for Next 10 Days: ', field_name]);
        hold off;
    case 4 % Predict 30 days
        predictions = plotPredict30Days(plot_data, field_name);
        data = plot_data.(field_name);
        n = length(data);
        X = (1:n)';
        X_future = (n+1:n+30)';
        figure;
        plot(X, data, 'b-o', 'DisplayName', 'Historical Data');
        hold on;
        plot(X_future, predictions, 'y--*', 'DisplayName', 'Predicted Next 30 Days');
        xlabel('Day');
        ylabel(field_name);
        legend;
        title(['Prediction for Next 30 Days: ', field_name]);
        hold off;
    otherwise
        error('Invalid prediction type .');
end