function integrated_order6_pentadiagonal_systematic()
    % Define the 73 valid permutation matrices for order 6
    perms_list = {
        [0 0 1 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P1
        [0 0 1 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P2
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P3
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P4
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P5
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P6
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P7
        [0 0 1 0 0 0; 0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P8
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P9
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P10
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P11
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P12
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P13
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P14
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P15
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P16
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P17
        [0 0 1 0 0 0; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P18
        [0 1 0 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 0 1 0],  % P19
        [0 1 0 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P20
        [0 1 0 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P21
        [0 1 0 0 0 0; 0 0 0 1 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P22
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P23
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P24
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P25
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P26
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P27
        [0 1 0 0 0 0; 0 0 1 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P28
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 1 0 0],  % P29
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P30
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P31
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P32
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 0 1 0],  % P33
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P34
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P35
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P36
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P37
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P38
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P39
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P40
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P41
        [0 1 0 0 0 0; 1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P42
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P43
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P44
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P45
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 0 1 0],  % P46
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P47
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P48
        [1 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P49
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P50
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P51
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P52
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P53
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P54
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P55
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P56
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P57
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P58
        [1 0 0 0 0 0; 0 0 1 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P59
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 1 0 0],  % P60
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P61
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P62
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P63
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 1 0 0 0; 0 0 0 0 1 0],  % P64
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 1 0 0 0; 0 0 0 0 0 1],  % P65
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P66
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1],  % P67
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0; 0 0 0 1 0 0],  % P68
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 1; 0 0 0 1 0 0; 0 0 0 0 1 0],  % P69
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 0 1 0 0],  % P70
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0; 0 0 0 1 0 0; 0 0 0 0 0 1],  % P71
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 0 1; 0 0 0 0 1 0],  % P72
        [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1]   % P73
    };

    % Create figure
    figure;
    hold on;
    
    % Plot unit circle
    t = linspace(0, 2*pi, 100);
    plot(cos(t), sin(t), 'k--', 'LineWidth', 1.5);
    
    % Plot convex hull structures
    for n = 1:6
        theta = linspace(0, 2*pi, n+1); theta(end) = [];
        roots_unity = exp(1i * theta);
        x = real(roots_unity); y = imag(roots_unity);
        if n == 1
            plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
        elseif n == 2
            plot(x, y, 'ro-', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'LineWidth', 1.5);
        else
            k = convhull(x, y);
            plot(x(k), y(k), 'r-', 'LineWidth', 1.5);
            plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
        end
    end

    % ======================================================
    % CODE 1: Random pentadiagonal doubly stochastic matrices
    % ======================================================
    num_matrices_code1 = 200000;
    m = 6;
    eigenvalues_code1 = zeros(num_matrices_code1*m, 1);
    idx = 1;
    
    fprintf('Generating Code 1 eigenvalues (random matrices)...\n');
    for i = 1:num_matrices_code1
        A = random_pentadiagonal_matrix(m);
        A = make_doubly_stochastic(A);
        eigs = eig(A);
        eigenvalues_code1(idx:idx+m-1) = eigs;
        idx = idx + m;
        
        if mod(i, 10000) == 0
            fprintf('Generated %d/%d random matrices\n', i, num_matrices_code1);
        end
    end
    eigenvalues_code1 = eigenvalues_code1(1:idx-1);
    h1 = plot(real(eigenvalues_code1), imag(eigenvalues_code1), 'g.', 'MarkerSize', 20);
    
    % ======================================================
    % CODE 2: All pairs of permutation matrices (73C2 = 2628 pairs)
    % ======================================================
    num_pairs = nchoosek(73, 2);
    samples_per_pair = 50;
    eigenvalues_pairs = zeros(num_pairs * samples_per_pair * m, 1);
    idx = 1;
    
    fprintf('\nGenerating Code 2 eigenvalues (2628 pairs, 100 samples each)...\n');
    pair_indices = nchoosek(1:73, 2);
    for i = 1:num_pairs
        P1 = perms_list{pair_indices(i, 1)};
        P2 = perms_list{pair_indices(i, 2)};
        
        alphas = rand(samples_per_pair, 1);
        for j = 1:samples_per_pair
            A = alphas(j)*P1 + (1-alphas(j))*P2;
            eigs = eig(A);
            eigenvalues_pairs(idx:idx+m-1) = eigs;
            idx = idx + m;
        end
        
        if mod(i, 200) == 0
            fprintf('Processed %d/2628 pairs\n', i);
        end
    end
    eigenvalues_pairs = eigenvalues_pairs(1:idx-1);
    h2 = plot(real(eigenvalues_pairs), imag(eigenvalues_pairs), 'b.', 'MarkerSize', 20);
    
    % ======================================================
    % CODE 3: All triplets of permutation matrices (73C3 = 62196 triplets)
    % ======================================================
    num_triplets = nchoosek(73, 3);
    samples_per_triplet = 10;
    eigenvalues_triplets = zeros(num_triplets * samples_per_triplet * m, 1);
    idx = 1;
    
    fprintf('\nGenerating Code 3 eigenvalues (62196 triplets, 10 samples each)...\n');
    triplet_indices = nchoosek(1:73, 3);
    for i = 1:num_triplets
        P1 = perms_list{triplet_indices(i, 1)};
        P2 = perms_list{triplet_indices(i, 2)};
        P3 = perms_list{triplet_indices(i, 3)};
        
        for j = 1:samples_per_triplet
            alpha = rand();
            beta = (1-alpha)*rand();
            gamma = 1 - alpha - beta;
            A = alpha*P1 + beta*P2 + gamma*P3;
            eigs = eig(A);
            eigenvalues_triplets(idx:idx+m-1) = eigs;
            idx = idx + m;
        end
        
        if mod(i, 1000) == 0
            fprintf('Processed %d/62196 triplets\n', i);
        end
    end
    eigenvalues_triplets = eigenvalues_triplets(1:idx-1);
    h3 = plot(real(eigenvalues_triplets), imag(eigenvalues_triplets), 'm.', 'MarkerSize', 1);
    
    % Final plot settings
    axis equal;
    grid on;
    title({'Eigenvalues of Order 6 Pentadiagonal DS Matrices', ...
          'General: Green | Pairs: Blue | Triples: Magenta'});
    xlabel('Real Part');
    ylabel('Imaginary Part');
    hold off;
    
    fprintf('\nAll computations completed.\n');
    fprintf('Total eigenvalues generated:\n');
    fprintf('  Code 1 (Random): %d\n', length(eigenvalues_code1));
    fprintf('  Code 2 (Pairs): %d\n', length(eigenvalues_pairs));
    fprintf('  Code 3 (Triplets): %d\n', length(eigenvalues_triplets));
end

% Supporting functions updated for order 6
function A = random_pentadiagonal_matrix(m)
    A = zeros(m);
    A(1:m+1:end) = rand(1, m); % Main diagonal
    
    if m > 1
        A(2:m+1:end) = rand(1, m-1); % First subdiagonal
        A(m+1:m+1:end) = rand(1, m-1); % First superdiagonal
    end
    
    if m > 2
        % Second subdiagonal
        idx = sub2ind([m, m], 3:m, 1:m-2);
        A(idx) = rand(1, m-2);
        % Second superdiagonal
        idx = sub2ind([m, m], 1:m-2, 3:m);
        A(idx) = rand(1, m-2);
    end
    
    if m > 3
        % Third subdiagonal
        idx = sub2ind([m, m], 4:m, 1:m-3);
        A(idx) = rand(1, m-3);
        % Third superdiagonal
        idx = sub2ind([m, m], 1:m-3, 4:m);
        A(idx) = rand(1, m-3);
    end
    
    if m > 4
        % Fourth subdiagonal (for order 6+)
        idx = sub2ind([m, m], 5:m, 1:m-4);
        A(idx) = rand(1, m-4);
        % Fourth superdiagonal
        idx = sub2ind([m, m], 1:m-4, 5:m);
        A(idx) = rand(1, m-4);
    end
end

function A = make_doubly_stochastic(A)
    max_iter = 1000;
    tolerance = 1e-6;
    for iter = 1:max_iter
        A = A ./ sum(A, 2);
        A = A ./ sum(A, 1);
        if all(abs(sum(A, 2) - 1) < tolerance) && all(abs(sum(A, 1) - 1) < tolerance)
            break;
        end
    end
end