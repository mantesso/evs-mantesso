**Préparation de la base de données**:
```bash
rails db:setup
```
- Ajoute des transactions pour aujourd'hui et hier.

**Démarrer le serveur**:
```bash
rails s
```

#### Utilisation

1. **Afficher le cours pour une date spécifique**:
   ```
   http://localhost:3000/potato_trades?date=2024-10-01
   ```

2. **Afficher le meilleur gain possible pour une date spécifique**:
   ```
   http://localhost:3000/potato_trades/max_profit?date=2024-10-02
   ```