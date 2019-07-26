class Player {
  constructor(name, score = 0) {
    this.name = name
    this.score = score
    this.rolls = []
  }
  roll(dice = 5) {
    if (dice === 0) {
      return 0
    }
    let rolls = []
    for (let i = 0; i < dice; i++) {
      rolls.push(Math.ceil(Math.random() * 6))
    }
    let nextDice = dice
    let sum = 0
    rolls.forEach(el => {
      if (el === 2 || el === 5) {
        nextDice--
      } else {
        sum += el
      }
    })
    this.rolls.push(sum)
    console.log(`${this.name} rolled ${sum}, ${nextDice} dice remain`)
    this.score += sum + this.roll(nextDice)
  }
  toString() {
    return `${this.name}: ${this.score}`
  }
}

class Game {
  constructor(names){
    this.players = names.map(name => new Player(name))
    this.playerCount = players.length
  }
  play() {
    let highestScore = 0
    let winners
    this.players.forEach(player => {
      player.roll()
      console.log(player.toString())
      if (player.score > highestScore) {
        winners = [ player ]
      } else if (player.score === highestScore) {
        winners.push(player)
      }
    })
    if (winners.length > 1) {
      console.log(`${winners.reduce((acc, winner) => `${
      acc}, ${winner.name}`, '')} win with ${highestScore} points`)
    } else {
      console.log(`${winners[0].name} wins with ${winners[0].score} points`)
    }
  }
}

// let chris = new Stuck()
//
// chris.roll()
//
// console.log(chris.score)
