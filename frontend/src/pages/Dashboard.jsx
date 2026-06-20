import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../utils/AuthContext';
import api from '../utils/api';

function ScoreCard({ result, index }) {
  const pct = Math.round((result.correctAnswers / result.totalQuestions) * 100);
  const badge = pct >= 70 ? 'badge-green' : pct >= 40 ? 'badge-yellow' : 'badge-red';
  const date = new Date(result.date).toLocaleDateString('en-IN', {
    day: 'numeric', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit'
  });

  return (
    <div style={{
      display: 'flex', alignItems: 'center', justifyContent: 'space-between',
      padding: '14px 18px',
      background: 'var(--surface2)',
      borderRadius: 10,
      border: '1.5px solid var(--border)',
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 14 }}>
        <span style={{ color: 'var(--muted)', fontSize: 13, minWidth: 20 }}>#{index + 1}</span>
        <div>
          <div style={{ fontWeight: 600, fontSize: 15 }}>{result.score} / {result.totalQuestions * 10}</div>
          <div style={{ color: 'var(--muted)', fontSize: 12, marginTop: 2 }}>{date}</div>
        </div>
      </div>
      <div style={{ display: 'flex', gap: 10, alignItems: 'center' }}>
        <span style={{ color: 'var(--green)', fontSize: 13 }}>✓ {result.correctAnswers}</span>
        <span style={{ color: 'var(--red)', fontSize: 13 }}>✗ {result.wrongAnswers}</span>
        <span className={`badge ${badge}`}>{pct}%</span>
      </div>
    </div>
  );
}

export default function Dashboard() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    api.get(`/results/${user.userId}`)
      .then(({ data }) => setResults(data))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [user.userId]);

  const best = results.length ? Math.max(...results.map(r => r.score)) : null;
  const last = results.length ? results[0].score : null;

  return (
    <div style={{ minHeight: '100vh', padding: '0 0 48px' }}>
      {/* Top nav */}
      <nav style={{
        display: 'flex', alignItems: 'center', justifyContent: 'space-between',
        padding: '16px 32px',
        borderBottom: '1.5px solid var(--border)',
        background: 'var(--surface)',
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
          <span style={{ fontSize: 22 }}>🧠</span>
          <span style={{ fontWeight: 700, fontSize: 18 }}>HirePrep</span>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
          <span style={{ color: 'var(--muted)', fontSize: 14 }}>👤 {user.name}</span>
          <button className="btn btn-outline" onClick={logout} style={{ padding: '8px 16px', fontSize: 13 }}>
            Logout
          </button>
        </div>
      </nav>

      <div style={{ maxWidth: 720, margin: '0 auto', padding: '40px 24px' }}>
        {/* Greeting */}
        <h2 style={{ fontSize: 24, fontWeight: 700, marginBottom: 4 }}>
          Hello, {user.name.split(' ')[0]} 👋
        </h2>
        <p style={{ color: 'var(--muted)', marginBottom: 32 }}>
          Ready for your next mock interview practice?
        </p>

        {/* Stats row */}
        {results.length > 0 && (
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 16, marginBottom: 32 }}>
            {[
              { label: 'Tests Taken', value: results.length, icon: '📝' },
              { label: 'Best Score', value: best, icon: '🏆' },
              { label: 'Last Score', value: last, icon: '📊' },
            ].map(({ label, value, icon }) => (
              <div key={label} className="card" style={{ textAlign: 'center', padding: '20px 16px' }}>
                <div style={{ fontSize: 26, marginBottom: 8 }}>{icon}</div>
                <div style={{ fontSize: 28, fontWeight: 700, color: 'var(--accent)' }}>{value}</div>
                <div style={{ fontSize: 12, color: 'var(--muted)', marginTop: 4 }}>{label}</div>
              </div>
            ))}
          </div>
        )}

        {/* Start Test CTA */}
        <div className="card" style={{
          display: 'flex', alignItems: 'center', justifyContent: 'space-between',
          background: 'var(--accent-dim)', border: '1.5px solid var(--accent)',
          marginBottom: 32, flexWrap: 'wrap', gap: 16
        }}>
          <div>
            <h3 style={{ fontWeight: 700, fontSize: 18, marginBottom: 4 }}>Start a New Test</h3>
            <p style={{ color: 'var(--muted)', fontSize: 14 }}>
              10 random MCQ questions · 10 minutes · 10 points each
            </p>
          </div>
          <button className="btn btn-primary" onClick={() => navigate('/test')}
            style={{ fontSize: 15, padding: '13px 28px' }}>
            Start Test →
          </button>
        </div>

        {/* History */}
        <h3 style={{ fontWeight: 600, marginBottom: 16, fontSize: 16 }}>
          Test History {results.length > 0 && <span style={{ color: 'var(--muted)', fontWeight: 400 }}>({results.length})</span>}
        </h3>

        {loading ? (
          <p style={{ color: 'var(--muted)' }}>Loading…</p>
        ) : results.length === 0 ? (
          <div className="card" style={{ textAlign: 'center', padding: 40 }}>
            <div style={{ fontSize: 40, marginBottom: 12 }}>📋</div>
            <p style={{ color: 'var(--muted)' }}>No tests taken yet. Start your first one!</p>
          </div>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {results.map((r, i) => <ScoreCard key={r.id} result={r} index={i} />)}
          </div>
        )}
      </div>
    </div>
  );
}
