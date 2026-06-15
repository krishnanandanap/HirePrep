import { useLocation, useNavigate } from 'react-router-dom';
import { useEffect } from 'react';

export default function ResultPage() {
  const { state } = useLocation();
  const navigate = useNavigate();
  const result = state?.result;

  useEffect(() => {
    if (!result) navigate('/dashboard');
  }, [result]);

  if (!result) return null;

  const { score, correctAnswers, wrongAnswers, totalQuestions, breakdown } = result;
  const pct = Math.round((correctAnswers / totalQuestions) * 100);

  const grade =
    pct >= 90 ? { label: 'Outstanding!', emoji: '🏆', color: '#f59e0b' } :
    pct >= 70 ? { label: 'Great Job!', emoji: '✅', color: 'var(--green)' } :
    pct >= 50 ? { label: 'Good Effort', emoji: '👍', color: 'var(--accent)' } :
    { label: 'Keep Practicing', emoji: '📚', color: 'var(--red)' };

  const optionLabel = (key) => {
    if (!key) return '—';
    const map = { A: 'A', B: 'B', C: 'C', D: 'D' };
    return map[key.toUpperCase()] || key;
  };

  return (
    <div style={{ minHeight: '100vh', padding: '32px 16px' }}>
      <div style={{ maxWidth: 680, margin: '0 auto' }}>

        {/* Score hero */}
        <div className="card" style={{
          textAlign: 'center', marginBottom: 28,
          background: 'var(--surface)',
          padding: '40px 28px',
        }}>
          <div style={{ fontSize: 52, marginBottom: 8 }}>{grade.emoji}</div>
          <h2 style={{ fontSize: 22, fontWeight: 700, color: grade.color, marginBottom: 4 }}>
            {grade.label}
          </h2>
          <div style={{ fontSize: 54, fontWeight: 800, color: grade.color, lineHeight: 1.1, margin: '16px 0' }}>
            {score}
            <span style={{ fontSize: 24, color: 'var(--muted)', fontWeight: 400 }}>/{totalQuestions * 10}</span>
          </div>
          <p style={{ color: 'var(--muted)', fontSize: 15 }}>
            You scored <strong style={{ color: grade.color }}>{pct}%</strong>
          </p>

          {/* Stat row */}
          <div style={{ display: 'flex', justifyContent: 'center', gap: 32, marginTop: 24 }}>
            <div>
              <div style={{ fontSize: 24, fontWeight: 700, color: 'var(--green)' }}>{correctAnswers}</div>
              <div style={{ fontSize: 12, color: 'var(--muted)' }}>Correct</div>
            </div>
            <div style={{ width: 1, background: 'var(--border)' }} />
            <div>
              <div style={{ fontSize: 24, fontWeight: 700, color: 'var(--red)' }}>{wrongAnswers}</div>
              <div style={{ fontSize: 12, color: 'var(--muted)' }}>Wrong</div>
            </div>
            <div style={{ width: 1, background: 'var(--border)' }} />
            <div>
              <div style={{ fontSize: 24, fontWeight: 700 }}>{totalQuestions}</div>
              <div style={{ fontSize: 12, color: 'var(--muted)' }}>Total</div>
            </div>
          </div>
        </div>

        {/* Actions */}
        <div style={{ display: 'flex', gap: 12, marginBottom: 28 }}>
          <button className="btn btn-primary" onClick={() => navigate('/test')} style={{ flex: 1 }}>
            Try Again
          </button>
          <button className="btn btn-outline" onClick={() => navigate('/dashboard')} style={{ flex: 1 }}>
            Dashboard
          </button>
        </div>

        {/* Breakdown */}
        <h3 style={{ fontWeight: 600, fontSize: 16, marginBottom: 14 }}>Question Breakdown</h3>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
          {breakdown?.map((item, i) => (
            <div key={item.questionId} className="card" style={{
              padding: '16px 20px',
              borderColor: item.correct ? 'rgba(34,197,94,0.3)' : 'rgba(239,68,68,0.25)',
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12 }}>
                <div style={{ flex: 1 }}>
                  <span style={{ fontSize: 12, color: 'var(--muted)', fontWeight: 600 }}>Q{i + 1}</span>
                  <p style={{ fontSize: 14, marginTop: 4, lineHeight: 1.5 }}>{item.questionText}</p>
                </div>
                <span style={{ fontSize: 18, flexShrink: 0, marginTop: 2 }}>
                  {item.correct ? '✅' : '❌'}
                </span>
              </div>

              <div style={{ display: 'flex', gap: 20, marginTop: 12 }}>
                <div>
                  <span style={{ fontSize: 11, color: 'var(--muted)' }}>YOUR ANSWER</span>
                  <div style={{
                    fontWeight: 600, marginTop: 2, fontSize: 14,
                    color: item.correct ? 'var(--green)' : 'var(--red)'
                  }}>
                    {optionLabel(item.yourAnswer) || '—'}
                  </div>
                </div>
                {!item.correct && (
                  <div>
                    <span style={{ fontSize: 11, color: 'var(--muted)' }}>CORRECT ANSWER</span>
                    <div style={{ fontWeight: 600, marginTop: 2, fontSize: 14, color: 'var(--green)' }}>
                      {optionLabel(item.correctAnswer)}
                    </div>
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>

        <div style={{ marginTop: 28, textAlign: 'center' }}>
          <button className="btn btn-outline" onClick={() => navigate('/dashboard')}>
            ← Back to Dashboard
          </button>
        </div>
      </div>
    </div>
  );
}
