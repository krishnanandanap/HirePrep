import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const categories = [
  {
    name: 'OOP',
    icon: '🧩',
    description: 'Object-Oriented Programming concepts',
  },
  {
    name: 'Data Structures',
    icon: '🌳',
    description: 'Arrays, stacks, queues, trees, graphs and more',
  },
  {
    name: 'Algorithms',
    icon: '⚡',
    description: 'Sorting, searching, complexity and algorithms',
  },
  {
    name: 'Databases',
    icon: '🗄️',
    description: 'SQL, databases, keys, queries and NoSQL',
  },
  {
    name: 'Web Development',
    icon: '🌐',
    description: 'HTTP, REST, web technologies and protocols',
  },
  {
    name: 'Java',
    icon: '☕',
    description: 'Java language and JVM concepts',
  },
  {
    name: 'Networking',
    icon: '🔗',
    description: 'OSI model, protocols and networking concepts',
  },
  {
    name: 'C Programming',
    icon: '💻',
    description: 'C language, pointers and programming concepts',
  },
  {
    name: 'Programming',
    icon: '⌨️',
    description: 'General programming concepts',
  },
];

export default function CategorySelection() {
  const navigate = useNavigate();

  const [selectedCategories, setSelectedCategories] = useState([]);

  const toggleCategory = (category) => {
    setSelectedCategories((previous) => {
      if (previous.includes(category)) {
        return previous.filter((item) => item !== category);
      }

      return [...previous, category];
    });
  };

  const startQuiz = () => {
    if (selectedCategories.length === 0) {
      return;
    }

    const categoryQuery = selectedCategories
      .map((category) => encodeURIComponent(category))
      .join(',');

    navigate(`/test?categories=${categoryQuery}`);
  };

  return (
    <div style={{ minHeight: '100vh', padding: '24px 16px' }}>
      <div style={{ maxWidth: 900, margin: '0 auto' }}>

        <div style={{ marginBottom: 28 }}>
          <button
            className="btn btn-outline"
            onClick={() => navigate('/dashboard')}
            style={{ marginBottom: 20 }}
          >
            ← Dashboard
          </button>

          <h2
            style={{
              fontWeight: 700,
              fontSize: 26,
              marginBottom: 8,
            }}
          >
            Choose Quiz Categories
          </h2>

          <p
            style={{
              color: 'var(--muted)',
              fontSize: 14,
              marginBottom: 6,
            }}
          >
            Select one or more categories for your quiz.
          </p>

          <p
            style={{
              color: 'var(--accent)',
              fontSize: 13,
              fontWeight: 600,
            }}
          >
            {selectedCategories.length === 0
              ? 'No categories selected'
              : `${selectedCategories.length} ${
                  selectedCategories.length === 1
                    ? 'category'
                    : 'categories'
                } selected`}
          </p>
        </div>

        <div
          style={{
            display: 'grid',
            gridTemplateColumns:
              'repeat(auto-fit, minmax(250px, 1fr))',
            gap: 16,
          }}
        >
          {categories.map((category) => {
            const isSelected = selectedCategories.includes(
              category.name
            );

            return (
              <button
                key={category.name}
                onClick={() => toggleCategory(category.name)}
                style={{
                  position: 'relative',
                  textAlign: 'left',
                  padding: 22,
                  borderRadius: 12,
                  border: isSelected
                    ? '2px solid var(--accent)'
                    : '1.5px solid var(--border)',
                  background: isSelected
                    ? 'var(--accent-dim)'
                    : 'var(--surface2)',
                  color: 'var(--text)',
                  cursor: 'pointer',
                  transition: 'all 0.2s',
                  boxShadow: isSelected
                    ? '0 0 0 2px rgba(108, 92, 231, 0.12)'
                    : 'none',
                }}
              >
                {/* Selection indicator */}
                <div
                  style={{
                    position: 'absolute',
                    top: 14,
                    right: 14,
                    width: 22,
                    height: 22,
                    borderRadius: 6,
                    border: isSelected
                      ? 'none'
                      : '1.5px solid var(--border)',
                    background: isSelected
                      ? 'var(--accent)'
                      : 'transparent',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: '#fff',
                    fontSize: 14,
                    fontWeight: 700,
                  }}
                >
                  {isSelected ? '✓' : ''}
                </div>

                <div
                  style={{
                    fontSize: 32,
                    marginBottom: 12,
                  }}
                >
                  {category.icon}
                </div>

                <h3
                  style={{
                    fontSize: 17,
                    fontWeight: 700,
                    marginBottom: 7,
                  }}
                >
                  {category.name}
                </h3>

                <p
                  style={{
                    color: 'var(--muted)',
                    fontSize: 13,
                    lineHeight: 1.5,
                  }}
                >
                  {category.description}
                </p>

                <div
                  style={{
                    marginTop: 16,
                    color: isSelected
                      ? 'var(--accent)'
                      : 'var(--muted)',
                    fontSize: 13,
                    fontWeight: 600,
                  }}
                >
                  {isSelected ? 'Selected ✓' : 'Click to select'}
                </div>
              </button>
            );
          })}
        </div>

        {/* Start button */}
        <div
          style={{
            marginTop: 28,
            display: 'flex',
            justifyContent: 'center',
          }}
        >
          <button
            className="btn btn-primary"
            onClick={startQuiz}
            disabled={selectedCategories.length === 0}
            style={{
              minWidth: 220,
              opacity:
                selectedCategories.length === 0 ? 0.5 : 1,
              cursor:
                selectedCategories.length === 0
                  ? 'not-allowed'
                  : 'pointer',
            }}
          >
            Start Quiz →
          </button>
        </div>

      </div>
    </div>
  );
}
